import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "descriptionInput", "descriptionDisplay"];

  connect() {
    console.log("Modal controller connected");
  }

  open() {
    this.modalTarget.classList.add("show");
    this.modalTarget.style.display = "block";
    document.body.classList.add("modal-open");
  }

  close() {
    this.modalTarget.classList.remove("show");
    this.modalTarget.style.display = "none";
    document.body.classList.remove("modal-open");
  }

  save() {
    const descriptionInput = this.modalTarget.querySelector("#descriptionInput");
    const description = descriptionInput.value;
    console.log("Données enregistrées ! : " + description);

    const tags = description.split(" ").map(tag => tag.trim());
    const filteredTags = tags.filter(str => str.length > 3);
    this.descriptionDisplayTarget.textContent = filteredTags.join(", ");
    console.log("Tags filtrés : " + filteredTags.join(", "));
    this.close();
  }

}
