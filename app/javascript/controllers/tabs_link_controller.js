import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["contentPlanning", "contentBudget", "contentDocuments", "contentPhotos", "contentMessagerie", "contentTaches"]

  connect() {
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
    this.contentTachesTarget.classList.add("d-none")
  }
  revealBudget() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.remove("d-none")
    this.contentTachesTarget.classList.add("d-none")
  }
  revealDocuments() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.remove("d-none")
    this.contentTachesTarget.classList.add("d-none")
  }
  revealPhotos() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.remove("d-none")
    this.contentTachesTarget.classList.add("d-none")
  }
  revealMessagerie() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.remove("d-none")
    this.contentTachesTarget.classList.add("d-none")
  }
  revealTaches() {
    this.contentPlanningTarget.classList.add("d-none")
    this.contentBudgetTarget.classList.add("d-none")
    this.contentDocumentsTarget.classList.add("d-none")
    this.contentPhotosTarget.classList.add("d-none")
    this.contentMessagerieTarget.classList.add("d-none")
    this.contentTachesTarget.classList.remove("d-none")
  }

}
