import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["mobile", "profile"];

  open() {
    this.mobileTarget.classList.remove("hidden");
  }

  close() {
    this.mobileTarget.classList.add("hidden");
  }

  profileToggle() {
    this.profileTarget.classList.toggle("hidden");
  }
}
