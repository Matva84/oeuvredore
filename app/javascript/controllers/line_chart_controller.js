import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {

  connect() {
    console.log("Line chart controller connected")

    new Chart(
      this.element, {
      type: 'bar',
      data: {
        labels: ['Men', 'Women'],
        datasets: [{
          label: 'Gender ratio',
          data: [504, 496],
          backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)'],
          hoverOffset: 4
        }]
      }
    });
}

  disconnect() {
    console.log("Line chart controller disconnected");
  }
}
