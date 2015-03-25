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
			<p>${post.content}
		</g:each>
	</body>
</html>
