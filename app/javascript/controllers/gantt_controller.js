import { Controller } from "@hotwired/stimulus"
import { Chart } from "chart.js";
import 'chartjs-adapter-date-fns';



// Connects to data-controller="gantt"
export default class extends Controller {
  static targets = ["projectName", "tasksName", "tasksEnd"]

  connect() {
    console.log("hello from gantt controller")
    var names = this.tasksNameTarget.dataset.value
    var names_json = JSON.parse(names)

    var ends = this.tasksEndTarget.dataset.value
    var ends_json = JSON.parse(ends)
    console.log(ends_json)

    var ends_dates = ends_json.map(function(dateString) {
      return new Date(dateString);
  });

  // Afficher les dates converties
  console.log(ends_dates);


    const data = {
      labels: names_json,
      datasets: [{
        label: this.projectNameTarget.dataset.value,
        data: [0,1,2,3,4,5,6,7,8],
        backgroundColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        barPercentage: 0.1
      }]
    };

    // config
    const config = {
      type: 'bar',
      data,
      options: {
        indexAxis : 'y',
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    // render init block
    const myChart = new Chart(
      document.getElementById('ganttChart'),
      config
    );

  }
}
