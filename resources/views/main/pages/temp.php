<?php

public function import()
{
    if (!$this->Admin) {
        $this->session->set_flashdata('error', lang('access_denied'));
        redirect('pos');
    }
    $this->load->helper('security');
    $this->form_validation->set_rules('userfile', lang('upload_file'), 'xss_clean');

    if ($this->form_validation->run() == true) {
        if (DEMO) {
            $this->session->set_flashdata('warning', lang('disabled_in_demo'));
            redirect('pos');
        }

        if (isset($_FILES['userfile'])) {
            $this->load->library('upload');

            $config['upload_path']   = 'uploads/';
            $config['allowed_types'] = 'csv';
            $config['max_size']      = '500';
            $config['overwrite']     = true;

            $this->upload->initialize($config);

            if (!$this->upload->do_upload()) {
                $error = $this->upload->display_errors();
                $this->session->set_flashdata('error', $error);
                redirect('products/import');
            }

            $csv = $this->upload->file_name;

            $arrResult = [];
            $handle    = fopen('uploads/' . $csv, 'r');
            if ($handle) {
                while (($row = fgetcsv($handle, 1000, ',')) !== false) {
                    $arrResult[] = $row;
                }
                fclose($handle);
            }
            array_shift($arrResult);  // Skip the header row

            $keys = ['code', 'name', 'cost', 'tax', 'price', 'category', 'store', 'quantity'];

            $final = [];
            foreach ($arrResult as $key => $value) {
                $final[] = array_combine($keys, $value);
            }

            if (sizeof($final) > 1001) {
                $this->session->set_flashdata('error', lang('more_than_allowed'));
                redirect('products/import');
            }

            $data = [];  // Data for `tec_products` table
            $product_store_qty_data = [];  // Data for `tec_product_store_qty` table

            foreach ($final as $csv_pr) {
                if ($this->products_model->getProductByCode($csv_pr['code'])) {
                    $this->session->set_flashdata('error', lang('check_product_code') . ' (' . $csv_pr['code'] . '). ' . lang('code_already_exist'));
                    redirect('products/import');
                }
                if (!is_numeric($csv_pr['tax']) || !is_numeric($csv_pr['quantity']) || !is_numeric($csv_pr['price'])) {
                    $this->session->set_flashdata('error', lang('invalid_numeric_value'));
                    redirect('products/import');
                }
                if (!($category = $this->site->getCategoryByCode($csv_pr['category']))) {
                    $this->session->set_flashdata('error', lang('check_category') . ' (' . $csv_pr['category'] . '). ' . lang('category_x_exist'));
                    redirect('products/import');
                }

                // Prepare product data for the `tec_products` table
                $data[] = [
                    'type'        => 'standard',
                    'code'        => $csv_pr['code'],
                    'name'        => $csv_pr['name'],
                    'cost'        => $csv_pr['cost'],
                    'tax'         => $csv_pr['tax'],
                    'price'       => $csv_pr['price'],
                    'category_id' => $category->id,
                ];

                // Prepare data for `tec_product_store_qty` table
                $store = $this->site->getStoreByCode($csv_pr['store']);  // Get store ID by store code
                if ($store) {
                    $product_store_qty_data[] = [
                        'store_id'   => $store->id,
                        'quantity'   => $csv_pr['quantity'],
                        'price'      => $csv_pr['price'],
                    ];
                } else {
                    $this->session->set_flashdata('error', lang('check_store') . ' (' . $csv_pr['store'] . '). ' . lang('store_x_exist'));
                    redirect('products/import');
                }
            }

            // Insert data into `tec_products` and `tec_product_store_qty` tables
            if ($this->products_model->addProduct($data, $product_store_qty_data)) {
                $this->session->set_flashdata('message', lang('products_added'));
                redirect('products');
            } else {
                $this->session->set_flashdata('error', lang('error_adding_products'));
                redirect('products/import');
            }
        }
    }

    // Handle form validation failure
    if ($this->form_validation->run() == true) {
        $this->session->set_flashdata('message', lang('products_added'));
        redirect('products');
    } else {
        $this->data['error']      = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['categories'] = $this->site->getAllCategories();
        $this->data['page_title'] = lang('import_products');
        $bc                       = [['link' => site_url('products'), 'page' => lang('products')], ['link' => '#', 'page' => lang('import_products')]];
        $meta                     = ['page_title' => lang('import_products'), 'bc' => $bc];
        $this->page_construct('products/import', $this->data, $meta);
    }
}
