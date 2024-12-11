import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Stimulus Lightbox Controller connected");
    if (typeof lightbox !== "undefined") {
      lightbox.init(); // Reinitialize Lightbox2
    }
  }
}
