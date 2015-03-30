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