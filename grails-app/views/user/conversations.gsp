<!DOCTYPE html>
<html>
	<head>
		<title>Conversations</title>
		<meta name="layout" content="main">
		<asset:stylesheet src="messages.css"/>
	</head>

	<body>
		<div id="conversations-list" class="conversations-list">
			<div id="new-chat-btn" class="btn btn-success" style="width: 100%; margin-bottom: 15px;">New message</div>
			<g:each in="${conversations}" var="conversation">
				<div class="conversation">
					<a href="${createLink(controller: 'conversation', action: 'view', id: conversation.id)}"> 
						<div class="user-picture">
							<g:if test="${conversation.users[0].name == currentUser.name}">
								<g:if test="${conversation.users[1].avatar}">
									<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: conversation.users[1].id])});"></div>
								</g:if>
								<g:else>
									<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
								</g:else>
								<div class="content">
									<span class="user-conversation">${conversation.users[1].name}
									 ${conversation.users[1].lastName} </span>
									<span class="text">${conversation.messages.last().sender.name}: ${conversation.messages.last().message}</span>
								</div>
							</g:if>
							<g:else>
								<g:if test="${conversation.users[0].avatar}">
									<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: conversation.users[0].id])});"></div>
								</g:if>
								<g:else>
									<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
								</g:else>
								<div class="content">
									<span class="user-conversation">${conversation.users[0].name}
									 ${conversation.users[0].lastName} </span>
									<span class="text">${conversation.messages.last().sender.name}: ${conversation.messages.last().message}</span>
								</div>
							</g:else>
						</div>
					</a>
				</div>
			</g:each>
		</div>
		<div class="conversation-box">
			<ul>
			<g:each in="${conversations.first().messages.sort{it.timestamp}}" var="message">
				<g:if test="${message.sender.id == user}">
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
			<form action="${createLink(controller: 'conversation', action: 'reply', params: [id: conversations.last().id])}" method="POST">
				<div class="form-group">
					<label for='message'>Message</label>
					<input class="form-control" type="text" name="message">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Send" name="send">
				</div>

			</form>
		</div>
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
			$(function (){
				$('#close-chat').click(function() {
					$('#new-chat').hide();
				});
				$('#new-chat-btn').click(function() {
					$('#new-chat').show();
				});
			});
		</script>
	</body>
</html>