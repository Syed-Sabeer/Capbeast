(() => {
    const cards = document.querySelectorAll(".product-card-widget");

    cards.forEach((card) => {
        const colorSlider = card.querySelector(".color-slider");
        const leftArrow = card.querySelector(".arrow.left");
        const rightArrow = card.querySelector(".arrow.right");
        const colorOptions = card.querySelectorAll(".color-option");
        const mainImage = card.querySelector("img");

        const scrollStep = 80;

        // Function to handle slider navigation with animation
        function slide(direction) {
            let maxScroll = colorSlider.scrollWidth - colorSlider.clientWidth;
            let newScroll = colorSlider.scrollLeft + direction * scrollStep;

            // Prevent over-scrolling and apply bounce effect
            if (newScroll < 0) {
                newScroll = 0;
                bounceEffect(colorSlider, -10);
            } else if (newScroll > maxScroll) {
                newScroll = maxScroll;
                bounceEffect(colorSlider, 10);
            }

            colorSlider.scrollTo({
                left: newScroll,
                behavior: "smooth"
            });
        }

        leftArrow.addEventListener("click", () => slide(-1));
        rightArrow.addEventListener("click", () => slide(1));

        // Function to toggle arrows visibility based on scroll position
        function toggleArrows() {
            leftArrow.classList.toggle("disabled", colorSlider.scrollLeft === 0);
            rightArrow.classList.toggle(
                "disabled",
                Math.round(colorSlider.scrollLeft) >= colorSlider.scrollWidth - colorSlider.clientWidth
            );
        }

        // Bounce effect by slightly shifting the slider
        function bounceEffect(element, offset) {
            element.style.transform = `translateX(${offset}px)`;
            setTimeout(() => {
                element.style.transform = "translateX(0)";
            }, 100);
        }

        // Handle color selection
        colorOptions.forEach((color) => {
            color.addEventListener("click", () => {
                colorOptions.forEach((option) => option.classList.remove("active"));
                color.classList.add("active");

                const imageUrl = color.dataset.image;
                if (imageUrl) {
                    mainImage.style.opacity = "0.5"; // Fade out
                    setTimeout(() => {
                        mainImage.src = imageUrl;
                        mainImage.style.opacity = "1"; // Fade in
                    }, 200);
                }
            });
        });

        // Update arrows when scrolling
        colorSlider.addEventListener("scroll", toggleArrows);
        toggleArrows(); // Initial state update
    });
})();
