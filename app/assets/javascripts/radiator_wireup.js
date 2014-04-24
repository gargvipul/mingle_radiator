$(document).ready(function() {

	$("#projects").change(function() {
		var projectId = $(this).val();
		$.ajax({
			url: "/radiators/" + projectId,
			dataType: "json"		
		}).done(function(data) {
			console.log("successsss");
			console.log(data);	
			
			var wikis = $("#wikis");
			data.forEach(function(page) {
				var option = $("<option>");
				option.val(page.identifier);
				option.html(page.name);
				wikis.append(option);
			});
		}).fail(function() {
			console.log("fail");
		});
	});	
});
