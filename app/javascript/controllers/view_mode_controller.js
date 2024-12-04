import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.updateViewMode();
    window.addEventListener("resize", this.updateViewMode.bind(this));
  }

  disconnect() {
    window.removeEventListener("resize", this.updateViewMode.bind(this));
  }

  updateViewMode() {
    const isDesktop = window.innerWidth >= 768; // Próg dla desktopu
    const viewMode = isDesktop ? "desktop" : "mobile";

    if (this.element.dataset.viewMode !== viewMode) {
      this.element.dataset.viewMode = viewMode;
      this.sendViewModeToServer(viewMode);
    }
  }

  sendViewModeToServer(viewMode) {
    fetch(`/pages/index`, {
      method: "GET",
      headers: {
        "X-Requested-With": "Turbo-Frame",
      },
      body: new URLSearchParams({ view_mode: viewMode }),
    });
  }
}
