import "@hotwired/turbo-rails";
import "controllers"
console.log("Turbo and Stimulus loaded successfully");

function initializeLightbox() {
  if (typeof lightbox !== "undefined") {
    console.log("Lightbox reinitialized");
    lightbox.init(); // Initialize Lightbox
  }
}

// Initialize Lightbox on page load and Turbo navigation events
document.addEventListener("turbo:load", initializeLightbox);
document.addEventListener("turbo:render", initializeLightbox);
