import "@hotwired/turbo-rails";
import "controllers"
console.log("Turbo and Stimulus loaded successfully");


document.addEventListener("turbo:render", () => {
  console.log("Turbo render triggered");
});

document.addEventListener("turbo:load", () => {
  if (window.lightbox) {
    lightbox.init();
  }
});

document.addEventListener("turbo:load", () => {
if (typeof lightbox !== "undefined") {
lightbox.init(); // Initialize Lightbox when the page loads
}
});

document.addEventListener("turbo:render", () => {
if (typeof lightbox !== "undefined") {
lightbox.init(); // Reinitialize Lightbox when the page is restored from cache
}
});

document.addEventListener("turbo:render", () => {
console.log("Turbo render triggered");
});