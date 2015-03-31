var postId = $("#id").val();
$("#id").remove();

function addComment(id){
	var comment = $("#comment").val()
	console.log(comment)
	$.ajax({
		url: links.addComment,
		method: 'GET',
		data: {id: id, comment: comment},
		success: function(response){
			console.log(response);
			$("#comments").append(comment + " by " + response);
			$("#comment").val("");
		},
		error: function(error){
			console.log(error);
		}
	});
}

function refresh () {
	console.log(postId)
	$.ajax({
		url: links.refresh,
		method: "GET",
		data: {id: postId},
		success: function(response){
			console.log(response);
			$("#comments").html(response)
		},
		error: function(error){
			console.log(error);
		}
	});
}

$(function(){
	setInterval(refresh, 30000);
});