<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><g:layoutTitle default="Welcome to MeliBook!"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<sec:ifLoggedIn>
    		Logged in as <sec:username /> (<g:link controller='logout' action='' style="color: inherit">Logout</g:link>)
  		</sec:ifLoggedIn>
  		<sec:ifNotLoggedIn>
			<a href="${createLink(controller:'login',action: '')}" style="color: inherit">Login</a>
		</sec:ifNotLoggedIn>

		<g:layoutBody/>
	</body>
</html>
