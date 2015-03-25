<!DOCTYPE html>
<html>
	<head>
		<title>Conversations</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<div id="conversation-form" align="center">
			<form action="${createLink(action: 'newConversation, controller: 'conversation')" method="POST">

				<div class="form-group">
					<label for='to'>To</label>
					<input class="form-control" type="text" name="to">
				</div>
				<div class="form-group">
					<label for='message'>Message</label>
					<input class="form-control" type="text" name="message">
				</div>



			</form>
		</div>

	</body>
</html>