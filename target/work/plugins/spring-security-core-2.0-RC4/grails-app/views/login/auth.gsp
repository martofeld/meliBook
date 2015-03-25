<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 400px;
		margin: 110px auto;
		text-align: center;
		border: 1px solid #F0F0F0;
		background-color: #FFFFFF;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 0px 4px 5px #D5D5D5;
	}

	.fheader {
		padding: 18px 26px 14px 26px;
		background-color: rgba(255, 213, 0, 1);
		margin: 0px 0 14px 0;
		color: #FFFFFF;
		font-family: lato;
		font-size: 18px;
		font-weight: lighter;
		background-image: url(${resource(dir: "../../", file: "images/bg.png")});
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 120px;
	}

	#login .inner .cssform label {
		font-weight: lighter;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login #remember_me_holder label {
		float: none;
		margin-left: 0;
		text-align: left;
		width: 200px
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}

	#loginForm {
		width: 85%;
		margin: auto;
	}

	label {
		font-weight: lighter;
	}
	</style>
</head>

<body>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>

			<div class="form-group">
				<label for='username'><g:message code="springSecurity.login.username.label"/></label>
				<input type='text' class="form-control" name='j_username' id='username'/>
			</div>

			<div class="form-group">
				<label for='password'><g:message code="springSecurity.login.password.label"/></label>
				<input type='password' class="form-control" name='j_password' id='password'/>
			</div>

			<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
			</g:if>

			<div class="form-group">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</div>

			<div class="form-group">
				<input type='submit' id="submit" class="btn btn-default" value='${message(code: "springSecurity.login.button")}'/>

				
			</div>

		</form>
		<a id="register" class="btn btn-default" value='Sign Up' href="${createLink(controller:'user', action:'register')}">Sign Up</a><br>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
