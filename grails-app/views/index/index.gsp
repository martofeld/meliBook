<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
	</head>
	<body>
		<h1>MeliBook</h1>
		<form method="post" action="${createLink(controller:'post', action:'newPost')}">
			<input type="text" name="content">
			<input type="submit" value="submit">
		</form>

		<g:each in="${posts}" var="post">
			<span>${post.content} by ${post.user.name}</span>
			<button onclick="addLike(${post.id})">like</button><br>
		</g:each>

		<script type="text/javascript">
			function addLike(id){
				$.ajax({
					url:'${createLink(controller: "post", action: "addLike")}',
					method: 'GET',
					data: {id: id},
					success: function(response){
						console.log(response)
						alert("ok");
					},
					error: function(response, error){
						console.log(error)
						console.log(response)
					}
				});
			}
		</script>
	</body>
</html>
