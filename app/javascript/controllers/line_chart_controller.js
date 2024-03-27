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
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)',
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'
          ]
        }, {
          label: "Réalisé",
          data: progression_prices_data,
          backgroundColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 205, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(201, 203, 207, 1)',
            'rgba(255, 99, 132, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 205, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(201, 203, 207, 1)'
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
