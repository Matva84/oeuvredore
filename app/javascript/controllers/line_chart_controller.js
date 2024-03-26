import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["tasksName", "tasksPrice", "tasksProgress"]

  connect() {

    var names = this.tasksNameTarget.dataset.value;
    var names_json = JSON.parse(names);

    var prices = this.tasksPriceTarget.dataset.value;
    var prices_json = JSON.parse(prices);

    var progress = this.tasksProgressTarget.dataset.value;
    var progress_json = JSON.parse(progress);

    var progression_prices_data = [];
    for (let i = 0; i < prices_json.length; i++) {
      progression_prices_data.push((prices_json[i] * progress_json[i]/100));
    }

    new Chart(
      this.element, {
      type: 'bar',
      data: {
        labels: names_json,
        datasets: [{
          label: "Prévisionnel",
          data: prices_json,
          backgroundColor: [
            'rgba(255, 159, 64, 0.2)'
          ]
        }, {
          label: "Réalisé",
          data: progression_prices_data,
          backgroundColor: [
            'rgba(255, 159, 64, 1)'
          ],
        }]
      },
      options: {
        scales: {
          x: {
            stacked: true,
          },
          y: {
            stacked: false,
            ticks: {
              callback: function(value, index, values) {
                return value + ' €';
              }
            }
          }
        }
      }
    });

    setTimeout(() => {
      this.element.style.maxWidth = '1000px';
    }, 100);
  }

  disconnect() {
    console.log("Line chart controller disconnected");
  }
}
