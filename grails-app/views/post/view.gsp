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
			<Post:comments comments="${post.comments}"/>			
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
				setInterval(refresh, 3000);
			});
		</script>
	</body>
</html>