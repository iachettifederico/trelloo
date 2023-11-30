import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  close() {
    this.modalTarget.classList.add("hidden")
  }

  handleKeydown() {
    if (event.key === "Escape") {
      this.close()
    }
  }
}
