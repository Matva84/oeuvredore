import { Application } from "@hotwired/stimulus"
//import { Chart } from "chart.js";
//import * as Chartjs from "chart.js";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }





//import DoughnutChartController from "./controllers/doughnut_chart_controller.js";
//import LineChartController from "./controllers/line_chart_controller.js";
//import PolarAreaChartController from "./controllers/polar_area_chart_controller.js";

//window.Stimulus = Application.start();

//const controllers = Object.values(Chartjs).filter(
//  (chart) => chart.id !== undefined
//);
//Chart.register(...controllers);

//Stimulus.register("doughnut-chart", DoughnutChartController);
//Stimulus.register("line-chart", LineChartController);
//Stimulus.register("polar-area-chart", PolarAreaChartController);
