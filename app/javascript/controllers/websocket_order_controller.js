import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="websocket-order"
export default class extends Controller {
  connect() {
    createConsumer().subscriptions.create({channel: "OrderChannel", room: "order_1"}, {
      received(data){
        if (data.action === "created"){
          location.reload()
        }
      }
    })
  }
}
