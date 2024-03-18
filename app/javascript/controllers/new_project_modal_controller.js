import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "openButton", "closeButton", "form"];

  connect() {
    this.openButtonTarget.addEventListener("click", () => this.openModal());
    this.closeButtonTarget.addEventListener("click", () => this.closeModal());
    this.formTarget.addEventListener("submit", (event) => this.handleSubmit(event));
  }

  openModal() {
    this.modalTarget.style.display = "block";
  }

  closeModal() {
    this.modalTarget.style.display = "none";
  }

  handleSubmit(event) {
    event.preventDefault();

    const formData = new FormData(this.formTarget);
    fetch('/projects', {
      method: 'POST',
      body: formData
    })
    .then(response => {
      if (response.ok) {
        this.closeModal();
        alert("Le projet a été créé avec succès");
        window.location.reload();
      } else {
        alert("Une erreur est survenue lors de la création du projet.");
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert("Une erreur est survenue lors de la création du projet.");
    });
  }
}
