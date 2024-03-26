import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-progression"
export default class extends Controller {
  static targets = ["completeBar", "progressBar"]

  connect() {
    if (this.completeBarTarget.dataset.value < 33) {
      this.completeBarTarget.classList.add("background-red")
      this.progressBarTarget.classList.add("red")
    } else if (this.completeBarTarget.dataset.value < 66) {
      this.completeBarTarget.classList.add("background-orange")
      this.progressBarTarget.classList.add("orange")
    } else {
      this.completeBarTarget.classList.add("background-green")
      this.progressBarTarget.classList.add("green")
    }
  }
}
