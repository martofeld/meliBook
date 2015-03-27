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

			<div id="posts">
				<g:each in="${posts}" var="post">
					<span>${post.content} by ${post.user.name} <br> likes: <span id="likeCounter${post.id}">${post.likes.size()}</span> <br></span>
					<input type="button" class="nolike" onclick="addLike(${post.id})" id="likeAdder${post.id}"><br>
					<!--<button onclick="addLike(${post.id})" id="likeAdder${post.id}">like</button><br>-->
				</g:each>
			</div>
		</div>
		<div id="areaFeed">
			<form method="post" action="${createLink(controller:'post', action:'newPost')}">
				<input type="text" name="content">
				<input type="submit" value="submit" name="area">
			</form>

			<div id="areaPosts">
				<g:each in="${areaPosts}" var="post">
					<span>${post.content} by ${post.user.name} <br> likes: <span id="likeCounter${post.id}">${post.likes.size()}</span> <br></span>
					<input type="button" class="nolike" onclick="addLike(${post.id})" id="likeAdder${post.id}"><br>
					<!--<button onclick="addLike(${post.id})" id="likeAdder${post.id}">like</button><br>-->
				</g:each>
			</div>
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
						$(counter).html(response);
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
					url: "${createLink(controller: 'index', action: 'refresh')}",
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

			function draw (allPosts) {
				var posts = allPosts.posts;
				var areaPosts = allPosts.areaPosts;
				
				$("#posts").html("");
				$("#areaPosts").html("");

				for(var id in posts){
					var post = posts[id];
					$("#posts")
						.append("<span>" + post.content + " by " + post.author + 
							"<br> likes:<span id='likeCounter"+post.id+"'>"+post.likes+"</span> <br></span>")
						.append('<input type="button" class="nolike" onclick="addLike('+post.id+')" id="likeAdder'+post.id+'"><br>');
				}
				
				for(var id in areaPosts){
					var post = areaPosts[id];
					$("#areaPosts")
						.append("<span>" + post.content + " by " + post.author + 
							"<br> likes:<span id='likeCounter"+post.id+"'>"+post.likes+"</span> <br></span>")
						.append('<input type="button" class="nolike" onclick="addLike('+post.id+')" id="likeAdder'+post.id+'"><br>');
				}
			}

			$(function() {
				setInterval(refreshFeed, 5000);

				$('.nolike .like').click(function(){
					$(this).toogleClass('nolike', 'like');
				});
			});
		</script>
	</body>
</html>