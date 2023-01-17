import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
  
  toggleNavBar() {
    const event = new CustomEvent("toggle-nav-bar")
    window.dispatchEvent(event)
    // window.alert("toggle it");

    // Open the side nav from the mobile app
    var link = document.getElementsByClassName("navbar-toggle");
    var link2 = link[0];
    link2.click();
  }
}
