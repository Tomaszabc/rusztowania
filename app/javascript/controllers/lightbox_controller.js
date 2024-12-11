// app/javascript/controllers/lightbox_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Lightbox initialized");
    // Reinitialize Lightbox2 after Turbo navigation
    lightbox.init();
  }
}
