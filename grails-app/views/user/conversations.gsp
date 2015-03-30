<!DOCTYPE html>
<html>
	<head>
		<title>Conversations</title>
		<meta name="layout" content="main">
		<asset:stylesheet src="messages.css"/>
	</head>

	<body>
		<div id="conversations-list" class="conversations-list">
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

		</div>
		



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

	</body>
</html>