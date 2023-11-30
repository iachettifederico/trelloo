import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { post } from "@rails/request.js"

export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      ghostClass: "sortable-drop",
      onEnd: this.onEnd.bind(this),
    })
  }

  onEnd(event) {
    // post("/sort", {
    //   body: {
    //     sort: {
    //       id:        event.item.dataset.sortableId,
    //       kind:      event.item.dataset.sortableKind,
    //       position:  event.newIndex + 1,
    //       to_parent_id: event.item.dataset.sortableToParentId,
    //     }
    //   }
    // })
    console.log("hola")
  }

}
