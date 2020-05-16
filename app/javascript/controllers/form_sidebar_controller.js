import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "authorContainer",
    "authorChevronIcon",
    "categoryContainer",
    "categoryChevronIcon"
  ];

  toggleAuthor() {
    this.authorContainerTarget.classList.toggle("hidden");
    this.authorChevronIconTarget.classList.toggle("-rotate-90");
  }

  toggleCategory() {
    this.categoryContainerTarget.classList.toggle("hidden");
    this.categoryChevronIconTarget.classList.toggle("-rotate-90");
  }
}
