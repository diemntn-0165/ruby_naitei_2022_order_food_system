// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../../assets/stylesheets/application"
// require("./js/jquery.min")
require("./js/bootstrap.min")
// require("./js/animsition.min")
// require("./js/bootstrap-slider.min")
// require("./js/jquery.isotope.min")
// require("./js/headroom")
// require("./js/foodpicky.min")
// require("./js/foodpicky")
require("bootstrap")
require("./js/cart");

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("jquery")
global.toastr = require("toastr");
toastr.options = {
  closeButton: false,
  debug: false,
  newestOnTop: false,
  progressBar: true,
  positionClass: "toast-top-right",
  preventDuplicates: false,
  onclick: null,
  showDuration: "300",
  hideDuration: "1000",
  timeOut: "3000",
  extendedTimeOut: "1000",
  showEasing: "swing",
  hideEasing: "linear",
  showMethod: "fadeIn",
  hideMethod: "fadeOut",
};
