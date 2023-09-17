import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger-form"
export default class extends Controller {
  static targets = ["passengers"]
  static values = { count: Number }

  addPassenger() {
    if (this.countValue < 4) {
      const template = this.passengersTarget.querySelector('template')
      const clone = template.content.cloneNode(true)
      const inputs = clone.querySelectorAll('input')
      const labels = clone.querySelectorAll('label')
      for (let i = 0; i < inputs.length; i++) {
        inputs[i].name = inputs[i].name.replace('INDEX', this.countValue)
        inputs[i].id = inputs[i].id.replace('INDEX', this.countValue)
        labels[i].htmlFor = labels[i].htmlFor.replace('INDEX', this.countValue)
      }
      this.passengersTarget.appendChild(clone)
      this.countValue++
    } else {
      alert("You can add maximum 4 passengers")
    }
  }
  removePassenger(e) {
    if (this.countValue > 1) {
      e.target.closest('.passenger_fields').remove()
      this.countValue--
    } else {
      alert("You must add atleast one passenger")
    }
  }
}
