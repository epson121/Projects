$( document ).ready(function(){
	
	a = window.location.href;
	b = "/alarm";
	if (a.indexOf(b, a.length - b.length ) == -1){
		setInterval(function(){
	   	$.post("/index", {
					"t" : "ok",
				}, 
				null, 
				"script"
			);
		},1000);
	}

});