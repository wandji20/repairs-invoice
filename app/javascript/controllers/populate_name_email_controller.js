import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'email', 'user']

  populate() {
    const selectedIndex = this.userTarget.selectedIndex;
    const email = this.userTarget.value;
    const name = this.userTarget.options[selectedIndex].text;
    this.nameTarget.value = name;
    this.emailTarget.value = email
  };
}