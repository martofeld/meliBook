<!DOCTYPE html>
<html>
	<head>
		<title>Register User</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<div class='header'>Register</div>
		<g:hasErrors bean="${userCommand}">
		  <ul>
		   <g:eachError var="err" bean="${userCommand}">
		       <li>${err}</li>
		   </g:eachError>
		  </ul>
		</g:hasErrors>
		<div id="register-form" class="form" align="center">
			<form action="register" method="POST">

				<div class="form-group">
					<label for='name'>Name</label>
					<input class="form-control" type="text" name="name" placeholder="Name" value="${userCommand.name}">
				</div>

				<div class="form-group">
					<label for='name'>Surname</label>
					<input class="form-control" type="text" name="lastName" placeholder="Surname" value="${userCommand.lastName}">
				</div>
				
				<div class="form-group">
					<label for='name'>E-mail</label>
					<input class="form-control" type="text" name="mail" placeholder="E-mail" value="${userCommand.mail}">
				</div>

				<div class="form-group">
					<label for='name'>Password</label>
					<input class="form-control" type="password" name="password" placeholder="Password" value="${userCommand.password}">
				</div>

				<div class="form-group">
					<label for='name'>Area</label>
					<input class="form-control" type="text" name="area" placeholder="Area" value="${userCommand.area}"><br>
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Register" name="register"/>
				</div>
				
			</form>
		</div>
	</body>
</html>