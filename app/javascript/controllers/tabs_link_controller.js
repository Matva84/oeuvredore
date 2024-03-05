import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["contentPlanning", "contentBudget", "contentDocuments", "contentPhotos", "contentMessagerie"]

  connect() {
    console.log("Hello from the tabs controller!")
  }

  hideAll() {
    //this.contentPlanningTarget.classList.add("d-none")
    //this.contentBudgetTarget.classList.add("d-none")
    //this.contentDocumentsTarget.classList.add("d-none")
    //this.contentPhotosTarget.classList.add("d-none")
    //this.contentMessagerieTarget.classList.add("d-none")
    targets.forEach(target => {
      target.classList.add("d-none")
    })
  }

  revealPlanning() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentPlanningTarget.classList.remove("d-none")
  }
  revealBudget() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.remove("d-none")
  }
  revealDocuments() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.remove("d-none")
  }
  revealPhotos() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.remove("d-none")
  }
  revealMessagerie() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.remove("d-none")
  }

}
