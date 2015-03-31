<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:stylesheet src="user-profile.css"/>
		<asset:javascript src="index.js"/>
	</head>
	<body>
		<div id="profile" class="profile">
			<User:avatar user="${user}"/>
			<div class="greetings">Hi ${user.name}!</div>
			<div class="info-notifications">
				You have 0 new messages
			</div>
			<div class="info-profile">
				Information
				<div class="info">Nombre<br>${user.name} ${user.lastName}</div>
				<div class="info">Area<br>${user.area.name}</div>
				<div class="info"><a href="${createLink(controller: 'user', action: 'select_avatar')}">Change Profile Picture</a></div>
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
			var links = {
				like: ${createLink(controller: "post", action: "addLike")},
				refreshFeed: ${createLink(controller: 'post', action: 'refreshPosts')},
				refreshAreaFeed: ${createLink(controller: 'post', action: 'refreshPosts')}
			}
		</script>
	</body> 
</html>