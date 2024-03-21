import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-documents"
export default class extends Controller {
  static targets = ["list","link","form"]

  connect() {
    console.log(this.formTarget)
    //console.log(this.inputTarget)
    console.log(this.listTarget)
    console.log("Search documents controller connected")
  }
  toggle(event) {
    event.preventDefault();
    const clickedLink = event.currentTarget;
    const isActive = clickedLink.classList.contains("active");

    if (!isActive) {
      clickedLink.classList.add("active");
      console.log(clickedLink.innerText, " selected")
    } else {
      clickedLink.classList.remove("active");
      console.log(clickedLink.innerText, " unselected")
    }
    //recuperer ici l'url generée par le link_to  pour faire le rafraichissement en ajax
    //utiliser le href au lieu de l'action comme dans le cours
  }
}
