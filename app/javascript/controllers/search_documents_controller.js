import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list","link"]

  connect() {
    console.log(this.formTarget)
    console.log(this.listTarget)
    console.log("Search documents controller connected")
    this.activeTags = "";
  }
  toggle(event) {
    event.preventDefault();
    const clickedLink = event.currentTarget;
    const isActive = clickedLink.classList.contains("active");
    console.log()
    if (!isActive) {
      clickedLink.classList.add("active");
      this.activeTags = this.activeTags + clickedLink.innerText + ",";
    } else {
      clickedLink.classList.remove("active");
      this.activeTags = this.activeTags.replace(clickedLink.innerText + ",", "");
    }
    const url = `${clickedLink.href}/documents?active_tags=${this.activeTags}`;
    console.log(url)
    fetch(url, {
      method: "GET",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      }
    })
    .then(response => response.json())
    .then((data) => {
      this.listTarget.innerHTML = data.documents;
      console.log(data.documents);
    })
  }
}
