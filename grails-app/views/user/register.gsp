<!DOCTYPE html>
<html>
	<head>
		<title>Register User</title>
	</head>

	<body>
		<g:hasErrors bean="${user}">
		  <ul>
		   <g:eachError var="err" bean="${user}">
		       <li>${err}</li>
		   </g:eachError>
		  </ul>
		</g:hasErrors>
		<div id="register-form" align="center">
			<form action="createUser" method="POST">
				<input type="text" name="name" placeholder="Name" value="${user.name}"><br>
				<input type="text" name="lastName" placeholder="Lastname"><br>
				<input type="text" name="birth" placeholder="Birth"><br>
				<input type="text" name="mail" placeholder="e-Mail"><br>
				<input type="text" name="password" placeholder="Password"><br>
				<input type="submit" value="Register" name="register"/>
			</form>
		</div>
	</body>
</html>