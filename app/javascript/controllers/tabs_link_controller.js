import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["contentPlanning", "contentBudget", "contentDocuments", "contentPhotos", "contentMessagerie"]

connect() {
  console.log("Hello from the tabs controller!")
}

revealPlanning() {
  console.log(this.contentTarget)
  this.contentTarget.element.classList.remove("d-none")
}
revealBudget() {
  console.log(this.contentTarget)
  this.contentTarget.element.classList.remove("d-none")
}
revealDocuments() {
  console.log(this.contentTarget)
  this.contentTarget.element.classList.remove("d-none")
}
revealPhotos() {
  console.log(this.contentTarget)
  this.contentTarget.element.classList.remove("d-none")
}
revealMessagerie() {
  console.log(this.contentTarget)
  this.contentTarget.element.classList.remove("d-none")
}
}
