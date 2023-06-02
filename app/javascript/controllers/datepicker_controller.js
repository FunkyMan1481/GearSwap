import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";
export default class extends Controller {
  static targets = ["start", "end"]
  static values = {
    disable: Array
  }
  connect() {
    flatpickr(this.startTarget, {
      "plugins": [new rangePlugin({ input: this.endTarget})],
      dateFormat: "Y-m-d",
      disable: this.disableValue
    })
  }
}
