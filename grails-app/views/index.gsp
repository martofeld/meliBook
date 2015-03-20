<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta name="layout" content="main">
	</head>
	<body>
		<h1>MeliBook</h1>
		<g:each list="${posts}" var="post">
			<p>${post.user.name}
		</g:each>
	</body>
</html>
