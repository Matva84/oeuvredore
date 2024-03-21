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

  update() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    const descriptionInput = this.modalTarget.querySelector("#descriptionInput");
    const description = descriptionInput.value;
    const tags = description.split(" ").map(tag => tag.trim());
    const filteredTags = tags.filter(str => str.length > 3).join(", ");
    //this.descriptionDisplayTarget.textContent = filteredTags;
    console.log("Tags filtrés : " + filteredTags + " pour le document " + this.element.dataset.modalValueId);
    this.close();
    console.log(this.modalTarget.action)
    //var url = new URL("/documents/" + this.element.dataset.modalValueId);
    //var url = new URL("/documents/" + this.element.dataset.modalValueId, window.location.origin);
    //console.log(url)
    //url.searchParams.append('tags', filteredTags);
    //url.searchParams.append('id', this.element.dataset.modalValueId);
    //console.log(url.searchParams)
    const url = `/documents/${this.element.dataset.modalValueId}`;
    fetch(url, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken // Inclure le jeton CSRF dans les en-têtes de la requête
      },
      body: JSON.stringify({ tags: filteredTags})
    })
  }
}
