<!DOCTYPE html>
<html>
	<head>
		<title>Chat with ${conversation.users[1]}</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<ul>
			<g:each in="${conversation.messages.sort{it.timestamp}}" var="message">
				<g:if test="${message.sender == conversation.users[0]}">
					<li class="sender" align="left">
						${message.message}
					</li>
				</g:if>
				<g:else>
					<li class="receiver" align="right">
						${message.message} 
					</li>
				</g:else>
			</g:each>
		</ul>
		<div id="conversation-form" align="center">
			<form action="${createLink(controller: 'conversation', action: 'reply', id: conversation.id)}" method="POST">
				<div class="form-group">
					<label for='message'>Message</label>
					<input class="form-control" type="text" name="message">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Send" name="send">
				</div>

			</form>
		</div>
		
	</body>
</html>