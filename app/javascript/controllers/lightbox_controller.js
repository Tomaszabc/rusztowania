export default class extends Stimulus.Controller {
  connect() {
    this.element.addEventListener('click', (event) => {
      event.preventDefault();
      lightbox.start(event.currentTarget);
    });
  }
}