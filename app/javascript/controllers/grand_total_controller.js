import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['total', 'subtotal'];
  static values = { total: { type: Number, default: 0 } }

  initialize() {
    this.show_grand_total()
  }

  subtotalTargetConnected() {
    this.compute_grand_total()
  }

  subtotalTargetDisconnected() {
    this.compute_grand_total()
  }

  compute_grand_total() {
    this.totalValue = 0
    const subtotals = this.subtotalTargets;
    subtotals.forEach((item) => {
        this.totalValue += Number(item.innerHTML)
    });
    this.show_grand_total()
  };

  show_grand_total() {
    this.totalTarget.innerHTML = this.totalValue
  }
}