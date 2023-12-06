import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  open() {
    this.modalTarget.classList.remove("hidden")
  }


  close() {
    if (event.target === this.modalTarget) {
      this.forceClose()
    }
  }

  forceClose() {
    this.modalTarget.classList.add("hidden")
  }

  handleKeydown() {
    if (event.key === "Escape") {
      this.forceClose()
    }
  }
}
