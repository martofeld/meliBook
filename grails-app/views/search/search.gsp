<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:stylesheet src="search.css"/>
	</head>
	<body>
		<g:if test="${springUsers != []}">
			<g:each in="${springUsers}" var="sUser">
				<div class="user-picture" style="margin: auto;width: 1%;height: 100px;">
					<User:avatar user="${sUser.user}" cssClass="photo"/>
					<a href="${createLink(controller: 'user', action:'index', params:[username: sUser.username])}">
						${sUser.user.name} ${sUser.user.lastName}
					</a>
					<span><p>${sUser.user.area.name}</p></span>
				</div>
			</g:each>
		</g:if>
		<g:else>
			<p>No user matches your search</p>
		</g:else>
			
	</body>
</html>