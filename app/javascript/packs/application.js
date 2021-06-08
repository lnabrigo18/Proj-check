// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs



import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/css/all.css";
import "bootswatch/dist/sketchy/bootstrap.min.css";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

jQuery.noConflict();

jQuery(document).on('turbolinks:load', function(){
    jQuery(".alert-success" ).fadeOut(5000);
    jQuery(".alert-danger" ).fadeOut(5000);
    jQuery(".task-error" ).fadeOut(8000);

    jQuery("#test-button").click(function(){
        alert("The paragraph was clicked.");
    });
});