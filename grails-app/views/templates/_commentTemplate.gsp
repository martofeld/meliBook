<g:each in="${comments}" var="comment">
	<p>${comment.comment} by ${comment.commenter.name} ${comment.commenter.lastName} </p>	
</g:each>