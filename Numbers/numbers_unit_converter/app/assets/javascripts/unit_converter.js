
$( document ).ready(function(){
	$('#unit').change(function() {
		jQuery.ajax({
		    url: "/change",
		    type: "GET",
		    data: { "ms" : $("#unit").val() },
		    dataType: "html",
		    success: function(data) {
		      $("#bla").html(data);
		    }
  		});
	});
	$('#inputLeft, #inputRight').on('keyup',function() {
		$.post("/calc", {
					"ms" : $("#unit").val(),
	    		"li" : $("#inputLeft").val(), 
	    		"ri" : $("#inputRight").val()
				}, 
				null, 
				"script"
			);
	});
	/*
	$('#left, #right').change(function() {
		jQuery.ajax({
		    url: "/change",
		    type: "GET",
		    data: { "ms" : $("#unit").val() },
		    dataType: "html",
		    success: function(data) {
		      $("bla").html(data);
		    }
  		});
	});
	*/
	/*
	$('#inputLeft, #inputRight').on('keyup',function() {
		alert($(this).attr("id"))
		jQuery.ajax({
		    url: "/calc",
		    type: "POST",
		    data: { "ms" : $("#unit").val(),
		    		"li" : $("#inputLeft").val(), 
		    		"ri" : $("#inputRight").val()
			},
			dataType: "html",
		    success: function(data) {
		    	
		    }
  		});
	});
*/
});
