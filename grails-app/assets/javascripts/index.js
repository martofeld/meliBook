//= require jquery
//= require_self

function addLike(id){
	$.ajax({
		url: links.like,
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
	$.ajax({
		url: links.refreshFeed,
		method: "GET",
		success: function(response){
			console.log(response)
			$("#posts").html(response);
		},
		error: function(error){
			console.log(error);
		}
	});
}

function refreshAreaFeed () {
	$.ajax({
		url: links.refreshAreaFeed,
		method: "GET",
		data: {area: true},
		success: function(response){
			console.log(response);
			$("#areaPosts").html(response);
		},
		error: function(error){
			console.log(error);
		}
	});
}

$(function() {
	setInterval(refreshFeed, 30000);
	setInterval(refreshAreaFeed, 30000);

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