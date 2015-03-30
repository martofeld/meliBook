<input type="hidden" id="id" value="${conversation.id}">
<ul >
	<g:each in="${messages}" var="message">
		<g:if test="${message.sender == user}">
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