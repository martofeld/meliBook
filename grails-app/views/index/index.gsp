}<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div id="profile" class="profile">
			<g:if test="${user.avatar}">
				<div class="profile-pic" style="background-image: url(${createLink(controller:'user', action:'avatar_image', params: [user: user])});"></div>
			</g:if>
			<g:else>
				<div class="profile-pic glyphicon glyphicon-user" style="padding: 25px; font-size: 60px; display: block;"></div>
			</g:else>
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
					<Post:post posts="${posts}"/>
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
					<Post:post posts="${areaPosts}"/>
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
				$.ajax({
					url: "${createLink(controller: 'post', action: 'refreshPosts')}",
					method: "GET",
					data: {area: false},
					success: function(response){
						console.log(response);
						$("#posts").html(response.responseText);
					},
					error: function(error){
						console.log(error);
					}
				});
			}

			function refreshAreaFeed () {
				$.ajax({
					url: "${createLink(controller: 'post', action: 'refreshPosts')}",
					method: "GET",
					data: {area: true},
					success: function(response){
						console.log(response);
						$("areaPosts").html(html);
					},
					error: function(error){
						console.log(error);
					}
				});
			}

			$(function() {
				setInterval(refreshFeed, 3000);
				setInterval(refreshAreaFeed, 3000);

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