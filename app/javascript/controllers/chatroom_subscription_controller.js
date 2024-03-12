import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScroll(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertMessageAndScroll(data) {
    this.element.insertAdjacentHTML("beforeend", data)
    this.element.scrollTo({
      bottom: this.element.scrollHeight,
      top: 0,
      behavior: "smooth",
    });
  }
}
