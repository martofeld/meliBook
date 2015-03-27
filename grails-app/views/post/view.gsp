<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
	</head>
	<body>
		<input type="hidden" id="id" value="${post.id}">
		<p>${post.content}</p>
		<label>Liked by:</label>
		<g:each in="${likers}" var="liker">
			${liker.name} ${liker.lastName}, 	
		</g:each>

		<label>Comments</label>
		<div id="comments">
			<g:each in="${post.comments.sort{it.timestamp}}" var="comment">
				<p>${comment.comment} by ${comment.commenter.name} ${comment.commenter.lastName} </p>	
			</g:each>
		</div>

		<input type="text" placerholder="comment" name="comment" id="comment">
		<input type="button" value="Comment" onclick="addComment(${post.id})">

		<script type="text/javascript">
			var postId = $("#id").val();
			$("#id").remove();
			
			function addComment(id){
				var comment = $("#comment").val()
				console.log(comment)
				$.ajax({
					url:"${createLink(controller: 'post', action: 'addComment')}",
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
					url: "${createLink(controller: 'post', action: 'refreshComments', params: [id: postId])}",
					method: "GET",
					data: {id: postId},
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

			function draw (allComments) {
				
				$("#comments").html("");

				for(var id in allComments){
					var comment = allComments[id];
					$("#comments").append("<p>" + comment.comment + " by " + comment.commenter + "</p>");
				}
			}

			$(function(){
				setInterval(refresh, 30000);
			});
		</script>
	</body>
</html>