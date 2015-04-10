$(function (){
	$('#close-chat').click(function() {
		$('#new-chat').hide();
	});
	$('#new-chat-btn').click(function() {
		$('#new-chat').show();
	});

	setInterval(refreshMessages, 15000);
});

function refresh (convId) {
	var id = $("#id").val();
	console.log(id);
	$("#id").remove();

	console.log(convId)
	$.ajax({
		url: links.refresh,
		method: "GET",
		data: {id: convId},
		success: function(response){
			console.log(response);
			id = convId;
			$("#message-list").html(response);
		},
		error: function(error){
			console.log(error);
		}
	});
}

function refreshMessages () {
	$.ajax({
		url: links.refresh,
		method: "GET",
		data: {id: id},
		success: function(response){
			console.log(response);
			$("#message-list").html(response);
		},
		error: function(error){
			console.log(error);
		}
	});
}