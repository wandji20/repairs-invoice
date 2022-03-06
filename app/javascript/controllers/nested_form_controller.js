import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['add_invoice_item', 'template']


  add_association(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random() * 20));

    this.add_invoice_itemTarget.insertAdjacentHTML('beforebegin', content);
  }

  remove_association(event) {
    event.preventDefault();
    const item = event.target.closest('.nested-field');
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }

}