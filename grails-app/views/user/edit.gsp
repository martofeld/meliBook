<html>
	<head>
		<title>Welcome to MeliBook! | Login or Sign Up</title>
		<asset:stylesheet src="bootstrap.min.css"/>
		<asset:stylesheet src="login.css"/>
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
	</head>

	<body>
		<div class="login">
			<div class="title">melibook</div>
			<div class="subtitle">edit</div>
			<div class="box">
				<g:hasErrors bean="${userCommand}">
				  <ul>
				   <g:eachError var="err" bean="${userCommand}">
				       <li>${err}</li>
				   </g:eachError>
				  </ul>
				</g:hasErrors>
				<form style="" action="edit" method="POST">

					<div class="form-group">
						<input class="form-control" type="text" name="name" placeholder="Name" value="${userCommand.name}">
					</div>

					<div class="form-group">
						<input class="form-control" type="text" name="lastName" placeholder="Surname" value="${userCommand.lastName}">
					</div>
					
					<div class="form-group">
						<input class="form-control" type="hidden" name="mail" placeholder="E-mail" value="${userCommand.mail}">
					</div>

					<div class="form-group">
						<input class="form-control" type="password" name="password" placeholder="Password" value="${userCommand.password}">
					</div>

					<div class="form-group">
						<g:select id="area" name="area" from="${areas}" optionKey="name" optionValue="name" />
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-default" value="Edit" name="edit"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>