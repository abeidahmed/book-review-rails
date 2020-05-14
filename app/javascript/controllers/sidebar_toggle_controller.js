import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  open() {
    this.sidebarTarget.classList.remove("-translate-x-full");
  }

  close() {
    this.sidebarTarget.classList.add("-translate-x-full");
  }
}
