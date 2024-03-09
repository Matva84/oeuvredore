import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {

  connect() {
    console.log("Line chart controller connected")

    var graph = document.getElementById("budgetgraph")
    var json_price = graph.dataset.price;
    var json_date = graph.dataset.date;
    var price = JSON.parse(json_price);
    var date = JSON.parse(json_date);

    new Chart(
      this.element, {
      type: 'bar',
      data: {
        labels: date,
        datasets: [{
          data: price,
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
          y: {
            beginAtZero: true
          }
        }
      }
    });
}

  disconnect() {
    console.log("Line chart controller disconnected");
  }
}
