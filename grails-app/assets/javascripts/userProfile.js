function addLike(id){
	$.ajax({
		url: links.addLike,
		method: 'GET',
		data: {id: id},
		success: function(response){
			console.log(response)
			var counter = "#likeCounter"+id;
			$(counter).html(response);
			if(response == 0){
				$(counter).switchClass( "like", "no-like");
			}else{
				$(counter).switchClass( "no-like", "like");
			}
		},
		error: function(response, error){
			console.log(error)
			console.log(response)
		}
	});
}

function refreshFeed () {
	console.log("asd");
	$.ajax({
		url: links.refreshFeed,
		method: "GET",
		dataType: "json",
		accepts: "application/json",
		success: function(response){
			console.log(response);
			draw(response);
		},
		error: function(error){
			console.log(error);
		}
	});
}

$(function() {
	//setInterval(refreshFeed, 3000);

	$('.nolike .like').click(function(){
		$(this).toogleClass('nolike', 'like');
	});

	$('#option-all-btn').click(function(){
		$('#areaFeed').hide();
		$('#all-feed').show();
		$('#option-all-btn').removeClass('feed-option').addClass('feed-option-selected')
		$('#option-area-btn').removeClass('feed-option-selected').addClass('feed-option')
	});

	$('#option-area-btn').click(function(){
		$('#all-feed').hide();
		$('#areaFeed').show();
		$('#option-area-btn').removeClass('feed-option').addClass('feed-option-selected')
		$('#option-all-btn').removeClass('feed-option-selected').addClass('feed-option')
	});
});