import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["mobile"];

  open() {
    this.mobileTarget.classList.remove("hidden");
  }

  close() {
    this.mobileTarget.classList.add("hidden");
  }
}
