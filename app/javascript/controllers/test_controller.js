import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "text" ];

    // static values = { isOpen: { type: Boolean, default: false } };

  connect() {
    console.log('Connected to Test Stimulus Controller')
  }

  change() {
    console.log(this.element);
    // this.element.style.backgroundColor = "blue";
    this.textTarget.style.backgroundColor = "Yellow"
  }
}