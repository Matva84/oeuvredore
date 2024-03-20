import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-documents"
export default class extends Controller {
  static targets = ["list","link"]

  connect() {
    //console.log(this.formTarget)
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
  }
}
