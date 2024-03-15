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
    // console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertMessageAndScroll(data) {
    this.element.insertAdjacentHTML("beforeend", data)
    const chat = document.getElementById("chatmsg")
    document.getElementById("message_content").value = '';
    document.getElementById('test').scrollIntoView({ behavior: 'smooth' });
  }
}
