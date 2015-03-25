<!DOCTYPE html>
<html>
	<head>
		<title>Conversations</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<div id="conversation-form" align="center">
			<form action="${createLink(controller: 'conversation', action: 'newConversation')}" method="POST">

				<div class="form-group">
					<label for='to'>To</label>
					<input class="form-control" type="text" name="to">
				</div>
				<div class="form-group">
					<label for='message'>Message</label>
					<input class="form-control" type="text" name="message">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Send" name="send">
				</div>

			</form>
		</div>

		<g:each in="${conversations}" var="conversation">
			${conversation.users.findById(0).name} ${conversation.users.findById(0).lastName}
			<a href="${createLink(controller: 'conversation', action: 'view', id: conversation.id)}"> Reply </a>
		</g:each>

	</body>
</html>