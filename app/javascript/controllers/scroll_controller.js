// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     console.log("ScrollController connected!");
//     this.restoreScroll();
//   }

//   restoreScroll() {
//     if (sessionStorage.scrollPosition) {
//       console.log("Restoring scroll position to:", sessionStorage.scrollPosition);
//       window.scrollTo(0, sessionStorage.scrollPosition);
//       sessionStorage.removeItem("scrollPosition");
//     }
//   }

//   saveScroll(event) {
//     console.log("Saving scroll position:", window.scrollY);
//     sessionStorage.scrollPosition = window.scrollY;
//   }
// }

