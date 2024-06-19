import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "menu", "hamburguer", "cross" ];

    static values = { isOpen: { type: Boolean, default: false } };

  connect() {
    console.log('Connected to Toggle Stimulus Controller')
  }

  menu() {
    console.log('you clicked me')
    console.log(this.menuTarget)

    this.isOpenValue ? this.hide() : this.show();

    this.isOpenValue = !this.isOpenValue;
  }

  show(){
    this.menuTarget.style.display = "flex";
    this.hamburguerTarget.style.display = "block";
    this.crossTarget.style.display = "none";
  }

  hide(){
    this.menuTarget.style.display = "none";
    this.hamburguerTarget.style.display = "none";
    this.crossTarget.style.display = "block";
  }
}
