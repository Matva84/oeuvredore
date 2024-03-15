import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["tasksName", "tasksPrice"]

  connect() {

    var names = this.tasksNameTarget.dataset.value
    var names_json = JSON.parse(names)

    var prices = this.tasksPriceTarget.dataset.value
    var prices_json = JSON.parse(prices)

    new Chart(
      this.element, {
      type: 'bar',
      data: {
        labels: names_json,
        datasets: [{
          label: "",
          data: prices_json,
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'
          ],
          borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(54, 162, 235)',
            'rgb(153, 102, 255)',
            'rgb(201, 203, 207)'
          ],
          borderWidth: 1,
          hoverOffset: 4
        }]
      },
      options: {
        scales: {
            yAxes: [{
                scaleLabel: {
                    display: true,
                    labelString: 'Prix (€)'
                }
            }]
        }
      }
    });
}

  disconnect() {
    console.log("Line chart controller disconnected");
  }
}
