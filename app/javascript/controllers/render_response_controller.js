import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="render-response"
export default class extends Controller {
  connect() {
  }

  async getSailPartial () {
    console.log("we're here");
    const response = await get("/sailing_sessions/add_sails_field");
    if (response.ok) {
      const body = await response.html;
      const tasksSection = document.querySelector("#sails");
      const templateElement = document.createElement("template");
      templateElement.innerHTML = body;

      tasksSection.appendChild(templateElement.content.firstElementChild);
    }
  }
}