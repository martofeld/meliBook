<div class="conversation" onclick="refresh(${conversation.id})">
	<div class="user-picture">
		<g:if test="${conversation.users[0].name == currentUser.name}">
			<User:avatar user="${conversation.users[1]}"/>
			<div class="content">
				<span class="user-conversation">${conversation.users[1].name}
				 ${conversation.users[1].lastName} </span>
				<span class="text">${conversation.messages.sort { 
					it.timestamp
				}.last().sender.name}: ${conversation.messages.sort { 
					it.timestamp
				}.last().message}</span>
			</div>
		</g:if>
		<g:else>
			<User:avatar user="${conversation.users[0]}"/>
			<div class="content">
				<span class="user-conversation">${conversation.users[0].name}
				 ${conversation.users[0].lastName} </span>
				<span class="text">${conversation.messages.last().sender.name}: ${conversation.messages.last().message}</span>
			</div>
		</g:else>
	</div>
</div>