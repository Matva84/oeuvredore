import { Controller } from "@hotwired/stimulus"
import { Chart } from "chart.js";
import "chartjs-adapter-date-fns"


// Connects to data-controller="gantt"
export default class extends Controller {
  static targets = ["projectName", "tasksName", "tasksEnd", "tasksStart", "tasksProgress"]

  connect() {
    // console.log("hello from gantt controller")

    var names = this.tasksNameTarget.dataset.value
    var names_json = JSON.parse(names)
    // console.log(names_json)

    var progress = this.tasksProgressTarget.dataset.value
    var progress_json = JSON.parse(progress)

    var starts = this.tasksStartTarget.dataset.value
    var starts_json = JSON.parse(starts)

    var tasks_start = starts_json.map(function(dateString) {
      return new Date(dateString).getTime();
    });
    var minStart = Math.min(...tasks_start);
    // console.log(tasks_start)

    var ends = this.tasksEndTarget.dataset.value
    var ends_json = JSON.parse(ends)

    var tasks_end = ends_json.map(function(dateString) {
      return new Date(dateString).getTime();
    });
    var maxEnd = Math.max(...tasks_end);
    // console.log(tasks_end)

  var progression_dates_data = [];
  for (let i = 0; i < tasks_start.length; i++) {
    progression_dates_data.push([tasks_start[i], (tasks_start[i] + (tasks_end[i] - tasks_start[i]) * progress_json[i]/100)]);
  }
  // console.log(progression_dates_data)

  var previsonnal_dates_data = [];
  for (let i = 0; i < tasks_start.length; i++) {
    previsonnal_dates_data.push([tasks_start[i], tasks_end[i]]);
  }
  // console.log(dates_data)

    const data = {
      labels: names_json,
      datasets: [{
        label: "Progression",
        data: progression_dates_data,
        backgroundColor: [
          'rgba(54, 162, 235, 1)',
        ],
        barPercentage: 0.4
      }, {
        label: "Prévisionnel",
        data: previsonnal_dates_data,
        backgroundColor: [
          'rgba(54, 162, 235, 0.5)',
        ],
        barPercentage: 0.4
      }
    ]
    };

    // config
    const config = {
      type: 'bar',
      data,
      options: {
        indexAxis : 'y',
        tooltips: {
          displayColors: true,
          callbacks: {
              mode: 'x',
          },
        },
        scales: {
          x: {
            stacked: false,
            min: minStart,
            max: maxEnd,
            type: 'time',
                time: {
                    unit: 'day'
                }
          },
          y: {
            stacked: true,
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
