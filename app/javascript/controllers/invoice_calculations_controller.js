import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['quantity', 'part', 'subtotal'];

  connect() {
    this.calculate_subtotal()
  }
  
  add_quantity() {
    this.quantityTarget.value = parseFloat(this.quantityTarget.value) + 1;
    this.calculate_subtotal();
  };

  subtract_quantity() {
    if (parseFloat(this.quantityTarget.value) > 1) {
      this.quantityTarget.value = parseFloat(this.quantityTarget.value) - 1;
      this.calculate_subtotal();
    };
  };

  calculate_subtotal = () => {
    const index = this.partTarget.selectedIndex;
    const selectedPart = this.partTarget.options[index]
    this.subtotalTarget.innerHTML = parseFloat(this.quantityTarget.value) * selectedPart.dataset['unit_price']
  }
}