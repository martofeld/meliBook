<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
	</head>
	<body>
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

		<form>
			<input type="text" placerholder="comment" name="comment" id="comment">
			<input type="button" value="Comment" onclick="addComment(${post.id})">
		</form>

		<script type="text/javascript">
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
		</script>
	</body>
</html>