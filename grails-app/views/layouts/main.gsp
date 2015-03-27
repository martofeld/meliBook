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
				background-color: #F0F0F0;
				font-weight: lighter;
			}
			nav {
				background-color: #FFD500;
				border-bottom: 1px solid rgb(216, 216, 64);
			    box-shadow: 0px 0px 6px #DDDCAC;
				color: #FFFFFF;
				font-size: 25px;
				font-weight: 300;
				padding: 10px;
				background-image: url(${resource(dir: "../../", file: "images/bg.png")});
			}
			.box {
				width: 500px;
				margin: 50px auto;
				text-align: center;
				border: 1px solid #F0F0F0;
				background-color: #FFFFFF;
				-moz-box-shadow: 2px 2px 2px #eee;
				-webkit-box-shadow: 2px 2px 2px #eee;
				-khtml-box-shadow: 2px 2px 2px #eee;
				box-shadow: 0px 4px 5px #D5D5D5;
				padding
			}
			.box-index {
				width: 700px;
				margin: 50px auto;
				text-align: center;
				border: 1px solid #F0F0F0;
				background-color: #FFFFFF;
				-moz-box-shadow: 2px 2px 2px #eee;
				-webkit-box-shadow: 2px 2px 2px #eee;
				-khtml-box-shadow: 2px 2px 2px #eee;
				box-shadow: 0px 4px 5px #D5D5D5;
				padding
			}
			.header {
				padding: 18px 26px 14px 26px;
				background-color: rgba(255, 213, 0, 1);
				margin: 0px 0 14px 0;
				color: #FFFFFF;
				font-family: lato;
				font-size: 18px;
				font-weight: lighter;
				background-image: url(${resource(dir: "/", file: "images/bg.png")});
			}
			.form {
				width: 85%;
				margin: auto;
			}
			label {
				font-weight: lighter;
			}

		</style>
	</head>
	<body>
		<nav class="nav-menu">
			melibook
			<sec:ifLoggedIn>
    			<span style="float: right; font-size: 16px; padding: 6px;">
    				<a href="${createLink(controller: 'user', action: 'conversations')}"> mensajes </a>
    				Welcome, <sec:username /> 
    				<g:link controller='logout' action='' style="color: inherit">Logout</g:link>
    			<span>
  			</sec:ifLoggedIn>
		</nav>
		<div class="box">
			<g:layoutBody/>
		</div>
		<footer>

		</footer>
	</body>
</html>
