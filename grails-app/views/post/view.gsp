<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
		<asset:javascript src="viewPost.js"/>
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
			var links = {
				addComment: ${createLink(controller: 'post', action: 'addComment')},
				refresh: ${createLink(controller: 'post', action: 'refreshComments')}
			};
		</script>
	</body>
</html>