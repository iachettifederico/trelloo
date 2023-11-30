import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { post } from "@rails/request.js"

export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      animation: 150,
      ghostClass: "sortable-drop",
      group: "tasks",
      onEnd: this.onEnd.bind(this),
    })
  }

  onEnd(event) {
    post("/sorting", {
      body: {
        sorting: {
          id:        event.item.dataset.sortableId,
          position:  event.newIndex,
          to_parent_id: event.to.dataset.sortableToParentId,
        }
      }
    })
  }

}
