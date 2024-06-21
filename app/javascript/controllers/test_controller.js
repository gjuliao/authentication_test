import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "text" ];
    static classes = ["background"];

    // static values = { isOpen: { type: Boolean, default: false } };

  connect() {
    console.log('Connected to Test Stimulus Controller')
  }

  change() {
    console.log(this.element);
    // this.element.style.backgroundColor = "blue";
    this.textTarget.style.backgroundColor = "Yellow";
    let p = document.createElement('p');
    p.textContent = 'Hello world';
    this.element.appendChild(p);

    let button = document.createElement('button');
    button.textContent = 'New Button';
    this.element.appendChild(button);
  }

  background() {
    this.element.classList.add(this.backgroundClass)
  }
}