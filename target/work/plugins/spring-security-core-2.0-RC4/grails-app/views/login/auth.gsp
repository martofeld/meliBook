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
			<div class="subtitle">login</div>
			<div class="box">
				<form style="border-bottom: 1px dotted rgba(255, 255, 255, 0.79);" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
					<div class="form-group">
						<label for='username'><g:message code="springSecurity.login.username.label"/></label>
						<input type='text' class="form-control" name='j_username' id='username'/>
					</div>
					<div class="form-group">
						<label for='password'><g:message code="springSecurity.login.password.label"/></label>
						<input type='password' class="form-control" name='j_password' id='password'/>
					</div>
					<div class="form-group">
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
						<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
						<g:if test='${flash.message}'>
							<div class='login_message'>${flash.message}</div>
						</g:if>
					</div>
					<div class="form-group">
						<input type='submit' id="submit" class="btn btn-default" value='Sign in'/>
					</div>
				</form>
			<a id="register" class="btn btn-default" value='Sign Up' href="${createLink(controller:'user', action:'register')}">Sign Up</a>
			</div>
		</div>

		<script type='text/javascript'>
			<!--
			(function() {
				document.forms['loginForm'].elements['j_username'].focus();
			})();
			// -->
		</script>
	</body>
</html>
