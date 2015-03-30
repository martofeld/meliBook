<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div id="profile" class="profile">
			<a href="${createLink(controller: 'user', action: 'index', params: [username: username])}">
				<g:if test="${user.avatar}">
					<div class="profile-pic" style="background-image: url(${createLink(controller:'user', action:'avatar_image', params: [user: user])});"></div>
				</g:if>
				<g:else>
					<div class="profile-pic glyphicon glyphicon-user" style="padding: 25px; font-size: 60px; display: block;"></div>
				</g:else>
			</a>
			<div class="greetings">Hi ${user.name}!</div>
			<div class="info-notifications">
				You have 0 new messages
			</div>
			<div class="info-new-members">
				New members of melibook!
				<div class="new-members-list">
					<g:each in="${users}" var="member">
						<div class="new-member">
							<g:if test="${member.avatar}">
								<div class="new-member-photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: member.id])});"></div>
							</g:if>
							<g:else>
								<div class="new-member-photo glyphicon glyphicon-user" style="padding: 8px;"></div>
							</g:else>
							<div class="new-member-info">
								<div class="new-member-name">${member.name}</div>
								<div class="new-member-area">${member.area.name}</div>
							</div>
						</div>
					</g:each>
				</div>
			</div>
		</div>
		<div class="options">
			<div id="option-all-btn" class="feed-option-selected">
				<div class="option-all">ALL</div>
			</div>
			<div id="option-area-btn" class="feed-option">
				<div class="option-area">AREA</div>
			</div>
		</div>
		<div id="feed">
			<div id="all-feed" style="display: inline;">
				<div id="new-post">
					<form method="post" action="${createLink(controller:'post', action:'newPost')}">
						<div class="input-group">
							<input class="form-control post-input" name="content" type="search" style="width: 88%;">
							<span class="glyphicon glyphicon-comment"></span>
							<button style="float: left;" class="btn btn-success" type="submit">Post!</button>
						</div>
					</form>
				</div>

				<div id="posts">
					<g:each in="${posts}" var="post">
							<div class="post">
								<div class="user-picture">
									<g:if test="${post.user.avatar}">
										<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: post.user.id])});"></div>
									</g:if>
									<g:else>
										<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
									</g:else>
								</div>
								<div class="content">
									<span class="user-post">${post.user.name}</span>
									<span class="text">${post.content}</span>
								</div>
								<div class="info-post">
									<div class="likes">
										<div id="likeCounter${post.id}" onclick="addLike(${post.id})" class="no-like" id="likeAdder${post.id}">${post.likes.size()}</div>
									</div>
								</div>
							</div>
					</g:each>
				</div>
			</div>

			<div id="areaFeed" style="display: none;">

				<div id="new-post">
					<form method="post" action="${createLink(controller:'post', action:'newPost', params: [area: user.area])}">
						<div class="input-group">
							<input class="form-control post-input" name="content" type="search" style="width: 88%;">
							<span class="glyphicon glyphicon-comment"></span>
							<button style="float: left;" class="btn btn-success" type="submit" name="area">Post!</button>
						</div>
					</form>
				</div>

				<div id="areaPosts">
					<g:each in="${areaPosts}" var="postArea">
						
						<div class="post">
							<div class="user-picture">
								<g:if test="${postArea.user.avatar}">
									<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: postArea.user.id])});"></div>
								</g:if>
								<g:else>
									<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
								</g:else>
							</div>
							<div class="content">
								<span class="user-post">${postArea.user.name}</span>
								<span class="text">${postArea.content}</span>
							</div>
							<div class="info-post">
								<div class="likes">
									<div id="likeCounter${postArea.id}" onclick="addLike(${postArea.id})" class="no-like" id="likeAdder${postArea.id}">${postArea.likes.size()}</div>
								</div>
							</div>
						</div>

					</g:each>
				</div>
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
					url: "${createLink(controller: 'post', action: 'refreshPosts')}",
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
					postId = post.id;
					var href = "/meliBook/post/view/"+postId
					console.log(href)
					$("#posts")
						.append("<span><a href='"+href+"'>" + post.content + "</a> by " + post.author + 
							"<br> likes:<span id='likeCounter"+post.id+"'>"+post.likes+"</span> <br></span>")
						.append('<input type="button" class="nolike" onclick="addLike('+post.id+')" id="likeAdder'+post.id+'"><br>');
				}
				
				for(var id in areaPosts){
					var post = areaPosts[id];
					postId = post.id;
					var href = "/meliBook/post/view/"+postId
					$("#areaPosts")
						.append("<span><a href='"+href+"'>" + post.content + "</a> by " + post.author + 
							"<br> likes:<span id='likeCounter"+post.id+"'>"+post.likes+"</span> <br></span>")
						.append('<input type="button" class="nolike" onclick="addLike('+post.id+')" id="likeAdder'+post.id+'"><br>');
				}
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
		</script>
	</body> 
</html>





















<!--





	</body>
</html>