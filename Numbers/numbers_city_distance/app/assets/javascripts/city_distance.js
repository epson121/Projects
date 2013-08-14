$(document).ready(function(){

	$('#submit').on('click',function() {
			id = $(this).attr("id");
			$.post("/index", {
						"pl" : $("#place_left").val(),
						"pr" : $("#place_right").val(),
					}, 
					null, 
					"script"
				);
	});

});