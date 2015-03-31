<!DOCTYPE html>
<html>
	<head>
		<title>Conversations</title>
		<meta name="layout" content="main">
		<asset:stylesheet src="messages.css"/>
		<asset:javascript src="conversation.js"/>
	</head>

	<body>
		<div id="conversations-list" class="conversations-list">
			<div id="new-chat-btn" class="btn btn-success" style="width: 100%; margin-bottom: 15px;">New message</div>
			<g:if test="${conversations != []}">
				<g:each in="${conversations}" var="conversation">
					<User:conversation conversation="${conversation}"/>
				</g:each>
			</g:if>
		</div>
		<div class="conversation-box" id="message-list">
			<g:if test="${conversationToShow != null}">
				<Messages:messages conversation="${conversationToShow}" user="${currentUser}"/>
			</g:if>
			<g:else>
				<p>No tiene mensajes aun</p>
			</g:else>
		</div>
		


		<div id="new-chat" class="conversation-form" style="display: none;position: absolute;width: 500px;height: 320px;background-color: rgba(173, 123, 1, 0.6);padding: 40px;margin:  auto;left: 0;right: 0;top: 0;bottom: 0;" align="center">
			<div id="close-chat" class="glyphicon glyphicon-remove" style="font-size: 15px; float: right; cursor: pointer; margin-top: -10px;"></div>
			<form action="/meliBook/conversation/newConversation" method="POST">

				<div class="form-group">
					<label for="to">To</label>
					<input class="form-control" type="text" name="to">
				</div>
				<div class="form-group">
					<label for="message">Message</label>
					<textarea class="form-control" type="text" name="message" style="
    height: 100px;
"></textarea>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-success" value="Send" name="send" style="
    margin: auto;
    width: 100%;
    background-color: rgb(140, 111, 40);
">
				</div>

			</form>
		</div>
		<script>
			var links = {refresh: "${createLink(controller: 'conversation', action: 'refreshMessages'}"};
		</script>
	</body>
</html>