<!DOCTYPE html>
<html>
	<head>
		<title>Welcome to MeliBook!</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<asset:stylesheet src="main.css"/>
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<g:layoutHead/>
	</head>
	<body>
		<div class="header">
			<div class="title">
				melibook
			</div>
			<nav class="menu">
				<div id="search-input" class="input-group">
					<input type="text" class="form-control" placeholder="Search" />
					<div class="input-group-btn">
						<button type="submit" class="btn btn-success">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</div>
				<div id="menu-options">
					<div id="notifications" class="menu-icon notifications"></div>
					<div id="messages" class="menu-icon messages"></div>
					<g:link controller='logout' action='' style="color: inherit"><div id="settings" class="menu-icon settings"></div></g:link>
				</div>
			</nav>
		</div>
		<div id="container">
			<g:layoutBody/>
		</div>
	</body> 
</html>