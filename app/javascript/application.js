// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"
import 'jquery_nested_form'
//= require jquery3
//= require rails-ujs
//= require cocoon
//= require jquery_nested_form

require("jquery")
require("@nathanvda/cocoon")

# application.js
$(document).on('turbolinks:load', function() {

    $('form').on('click', '.remove_record', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('tr').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

});
