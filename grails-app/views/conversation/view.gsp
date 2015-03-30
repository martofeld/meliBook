<!DOCTYPE html>
<html>
	<head>
		<title>Chat with ${conversation.users[1]}</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<input type="hidden" id="id" value="${conversation.id}"/>
		<ul id="messages-list">
			<Messages:messages conversation="${conversation}" user="${user}"/>
		</ul>
		<div id="conversation-form" align="center">
			<form action="${createLink(controller: 'conversation', action: 'reply', params: [id: conversation.id])}" method="POST">
				<div class="form-group">
					<label for='message'>Message</label>
					<input class="form-control" type="text" name="message">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Send" name="send">
				</div>

			</form>
		</div>

		<script type="text/javascript">
			
		</script>

	</body>
</html>