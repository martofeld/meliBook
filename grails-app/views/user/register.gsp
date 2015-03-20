<!DOCTYPE html>
<html>
	<head>
		<title>Register User</title>
	</head>

	<body>
		<g:hasErrors bean="${userCommand}">
		  <ul>
		   <g:eachError var="err" bean="${userCommand}">
		       <li>${err}</li>
		   </g:eachError>
		  </ul>
		</g:hasErrors>
		<div id="register-form" align="center">
			<form action="register" method="POST">
				<input type="text" name="name" placeholder="Name" value="${userCommand.name}"><br>
				<input type="text" name="lastName" placeholder="Lastname" value="${userCommand.lastName}"><br>
				<input type="text" name="mail" placeholder="e-Mail" value="${userCommand.mail}"><br>
				<input type="text" name="password" placeholder="Password" value="${userCommand.password}"><br>
				<input type="text" name="area" placeholder="area" value="${userCommand.area}"><br>
				<input type="submit" value="Register" name="register"/>
			</form>
		</div>
	</body>
</html>