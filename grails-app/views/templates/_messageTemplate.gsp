<g:each in="${conversation.messages.sort{it.timestamp}}" var="message">
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