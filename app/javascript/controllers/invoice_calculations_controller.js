import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['quantity'];

  add_quantity() {
    
    this.quantityTarget.value = parseFloat(this.quantityTarget.value) + 1;
  };

  subtract_quantity() {
    if (parseFloat(this.quantityTarget.value) > 1) {
      this.quantityTarget.value = parseFloat(this.quantityTarget.value) - 1;
    }
  };
}