// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require microplugin
//= require sifter
//= require bootstrap
//= require turbolinks
//= require Split.js/split.js
//= require_tree .

// function split_panel() {
// 	var instance = Split(['#main-content', '#sidebar'], {
// 	    sizes: [70, 30]
// 	});
// }

// $(document).ready(function() {
// 	$(document).on('turbolinks:load', split_panel );
// });
 
$(document).ready(function() {
	// $('.selective').selectize({
	//     create: true,
	//     sortField: 'text'
	// });
});

$(document).on("change", ".project-switch", function(e) {
	$(this).closest("form").submit();
});