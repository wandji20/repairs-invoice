import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log('running');
    console.log('A am in');
  }
}