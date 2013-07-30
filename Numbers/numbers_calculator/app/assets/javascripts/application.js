// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$('#1, #2, #3, #4, #5, #6, #7, #8, #9, #0').click(function (event) {
	appendToTextbox("#screen", $(this).attr("id"));
  event.preventDefault(); // Prevent link from following its href
});


$('#ob, #cb, #minus, #plus, #div, #mult, #point, #sin, #cos, #mod, #del').click(function(event) {
	var currentId = $(this).attr('id');
	if (currentId == "ob"){
		appendToTextbox("#screen", "(")
	} else if (currentId == "cb") {
		appendToTextbox("#screen", ")")
	} else if (currentId == "minus") {
		appendToTextbox("#screen", "-")
	} else if (currentId == "plus") {
		appendToTextbox("#screen", "+")
	} else if (currentId == "div") {
		appendToTextbox("#screen", "/")
	} else if (currentId == "mult") {
		appendToTextbox("#screen", "*")
	} else if (currentId == "mod") {
		appendToTextbox("#screen", "%")
	} else if (currentId == "sin") {
		appendToTextbox("#screen", "sin(")
	} else if (currentId == "cos") {
		appendToTextbox("#screen", "cos(")
	}	else if (currentId == "point"){
		appendToTextbox("#screen", ".")
	} else if (currentId == "del"){
		a = $("#screen")
		a.val(a.val().substring(0, a.val().length - 1));
	}
  event.preventDefault(); // Prevent link from following its href
});

$('#c').click(function(event) {
	$("#screen").val("");
	event.preventDefault(); // Prevent link from following its href
});


//Append text to input element
function appendToTextbox(id, text){
    $(id).val($(id).val() + text);
}