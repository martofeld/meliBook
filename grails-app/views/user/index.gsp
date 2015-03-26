<!DOCTYPE html>
<html>
	<head>
		<title>Title of the document</title>
		<meta name="layout" content="main">
		<style>
		</style>
	</head>
	<body>
		<div id="user-info">
			<span>${ user.name } ${ user.lastName }</span>
			<span>${ user.birth }</span>
		</div>
		<div id="wall">
			<g:each in="${posts}" var="post">
				<span>${post.content} by ${post.user.name}</span>
				<button onclick="addLike(${post.id})">like</button><br>
			</g:each>
		</div>

	</body>
</html>