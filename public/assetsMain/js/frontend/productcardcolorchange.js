 // Get all product cards
 const cards = document.querySelectorAll(".product-card");

    cards.forEach((card) => {
        const colorSlider = card.querySelector(".color-slider");
        const leftArrow = card.querySelector(".arrow.left");
        const rightArrow = card.querySelector(".arrow.right");
        const colorOptions = card.querySelectorAll(".color-option");
        const mainImage = card.querySelector(".img-fluid"); // Main image

        let scrollAmount = 0;

        // Handle slider navigation
        leftArrow.addEventListener("click", () => {
            scrollAmount -= 80;
            colorSlider.scrollTo({
                left: scrollAmount,
                behavior: "smooth",
            });
            toggleArrows(colorSlider, leftArrow, rightArrow);
        });

        rightArrow.addEventListener("click", () => {
            scrollAmount += 80;
            colorSlider.scrollTo({
                left: scrollAmount,
                behavior: "smooth",
            });
            toggleArrows(colorSlider, leftArrow, rightArrow);
        });

        function toggleArrows(slider, left, right) {
            left.classList.toggle(
                "disabled",
                slider.scrollLeft === 0
            );
            right.classList.toggle(
                "disabled",
                slider.scrollLeft >= slider.scrollWidth - slider.clientWidth
            );
        }

        // Handle color selection
        colorOptions.forEach((color) => {
            color.addEventListener("click", () => {
                // Remove active class from all options
                colorOptions.forEach((option) => option.classList.remove("active"));
                // Add active class to the selected color
                color.classList.add("active");
                // Update the main image
                const imageUrl = color.dataset.image;
                if (imageUrl) {
                    mainImage.src = imageUrl;
                }
            });
        });

        toggleArrows(colorSlider, leftArrow, rightArrow);
    });