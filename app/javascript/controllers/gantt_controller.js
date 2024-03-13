import { Controller } from "@hotwired/stimulus"
import { Chart } from "chart.js";


// Connects to data-controller="gantt"
export default class extends Controller {
  static targets = ["projectName", "tasksName", "tasksEnd", "tasksStart"]

  connect() {
    console.log("hello from gantt controller")

    var names = this.tasksNameTarget.dataset.value
    var names_json = JSON.parse(names)

    var starts = this.tasksStartTarget.dataset.value
    var starts_json = JSON.parse(starts)

    var tasks_start = starts_json.map(function(dateString) {
      return new Date(dateString).getTime();
    });
    var minStart = Math.min(...tasks_start);
    console.log(tasks_start)

    var ends = this.tasksEndTarget.dataset.value
    var ends_json = JSON.parse(ends)

    var tasks_end = ends_json.map(function(dateString) {
      return new Date(dateString).getTime();
    });
    var maxEnd = Math.max(...tasks_end);
    console.log(tasks_end)

  var dates_data = [];
  for (let i = 0; i < tasks_start.length; i++) {
    dates_data.push([tasks_start[i], tasks_end[i]]);
  }
  console.log(dates_data)




    const data = {
      labels: names_json,
      datasets: [{
        label: "Déroulée",
        data: dates_data,
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
        barPercentage: 0.2
      }]
    };

    // config
    const config = {
      type: 'bar',
      data,
      options: {
        indexAxis : 'y',
        scales: {
          x: {
            min: minStart,
            max: maxEnd,
          },
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
