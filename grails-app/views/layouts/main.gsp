<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><g:layoutTitle default="Welcome to MeliBook!"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
		<g:layoutHead/>

		<style>
			body {
				font-family: Lato;
			}
			nav {
				background-color: #FFD500;
				border-bottom: 1px solid rgb(216, 216, 64);
			    box-shadow: 0px 0px 6px #DDDCAC;
				color: #FFFFFF;
				font-size: 25px;
				font-weight: 300;
				padding: 10px;
			}
		</style>
	</head>
	<body>
		<sec:ifLoggedIn>
    		Logged in as <sec:username /> (<g:link controller='logout' action='' style="color: inherit">Logout</g:link>)
  		</sec:ifLoggedIn>
  		<sec:ifNotLoggedIn>
			<a href="${createLink(controller:'login',action: '')}" style="color: inherit">Login</a>
		</sec:ifNotLoggedIn>

		<g:layoutBody/>
		<nav class="navbar navbar-static-top">
			melibook
		</nav>
		<g:layoutBody/>
		<footer>

		</footer>
	</body>
</html>
