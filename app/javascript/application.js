// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
window.Turbo = Turbo
Turbo.session.drive = true

import "./controllers"
import * as bootstrap from "bootstrap" 
import "./bootstrap-select.js"
import "./jquery"
import "./black-dashboard.min.js"

import "./src/turbo_native/bridge"


// import { Turbo } from "@hotwired/turbo-rails"
// window.Turbo = Turbo
// Turbo.session.drive = true

// import * as bootstrap from "bootstrap"
import "chartkick/chart.js"
import "./sweetalert"



// import "chartkick"
// import "Chart.bundle"
// import 'sweetalert'
