<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
	</head>
	<body>
		<h1>MeliBook</h1>
		<div id="feed">
			<form method="post" action="${createLink(controller:'post', action:'newPost')}">
				<input type="text" name="content">
				<input type="submit" value="submit">
			</form>

			<g:each in="${posts}" var="post">
				<span>${post.content} by ${post.user.name} <br> likes: <span id="likeCounter${post.id}">${post.likers.size()}</span> <br></span>
				<input type="image" src="${resource(dir: '/', file: 'images/nolike-icon.png')}" onclick="addLike(${post.id})" id="likeAdder${post.id}" style="background: yellow"><br>
				<!--<button onclick="addLike(${post.id})" id="likeAdder${post.id}">like</button><br>-->
			</g:each>
		</div>
		<div id="areaFeed">
			<form method="post" action="${createLink(controller:'post', action:'newPost')}">
				<input type="text" name="content">
				<input type="submit" value="submit">
			</form>

			<g:each in="${areaPosts}" var="post">
				<span>${post.content} by ${post.user.name} <br> likes: <span id="likeCounter${post.id}">${post.likers.size()}</span> <br></span>
				<input type="image" src="${resource(dir: '/', file: 'images/nolike-icon.png')}" onclick="addLike(${post.id})" id="likeAdder${post.id}" style="background: yellow"><br>
				<!--<button onclick="addLike(${post.id})" id="likeAdder${post.id}">like</button><br>-->
			</g:each>
		</div>
		<script type="text/javascript">
			function addLike(id){
				$.ajax({
					url:'${createLink(controller: "post", action: "addLike")}',
					method: 'GET',
					data: {id: id},
					success: function(response){
						console.log(response)
						var counter = "#likeCounter"+id;
						var button = "#likeAdder"+id;
						$(counter).html(response);
						$(button).attr('src', '${resource(dir: "/", file: "images/like-icon.png")}').attr('style', 'background: none');
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
