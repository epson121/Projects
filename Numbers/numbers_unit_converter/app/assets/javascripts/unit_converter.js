
$( document ).ready(function(){
	/*
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
	*/
	$('#unit, #left, #right').on('change',function() {
		id = $(this).attr("id");
		$.post("/change", {
					"id" : id,
					"ms" : $("#unit").val(),
					"lv" : $("#left").val(),
					"rv" : $("#right").val(),
	    		"li" : $("#inputLeft").val(), 
	    		"ri" : $("#inputRight").val()
				}, 
				null, 
				"script"
			);
	});

	$('#inputLeft, #inputRight').on('keyup',function() {
		id = $(this).attr("id");
		$.post("/calc", {
					"id" : id,
					"ms" : $("#unit").val(),
					"lv" : $("#left").val(),
					"rv" : $("#right").val(),
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
