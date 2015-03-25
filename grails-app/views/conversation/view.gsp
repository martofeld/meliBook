<!DOCTYPE html>
<html>
	<head>
		<title>Chat with ${conversation.users.get(1)}</title>
		<meta name="layout" content="main">
	</head>

	<body>
		<ul>
			<g:each in="${conversation.messages}" var="message">
				<g:if test="${message.sender == conversation.users.get(0)}">
					<li class="sender" align="left">
						${message.message}
					</li>
				</g:if>
				<g:else>
					<li class="receiver"rig align="right">
						${message.message} 
					</li>
				</g:else>
			</g:each>
		</ul>
		
	</body>
</html>