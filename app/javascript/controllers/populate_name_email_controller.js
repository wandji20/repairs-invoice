import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'email', 'user']

  populate() {
    const selectedIndex = this.userTarget.selectedIndex;
    const selectedOption = this.userTarget.options[selectedIndex]
    const email = selectedOption.dataset['email'];
    const name = selectedOption.text;
    this.nameTarget.value = name;
    this.emailTarget.value = email
  };
}