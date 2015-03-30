<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:stylesheet src="search.css"/>
	</head>
	<body>
		<g:each in="${springUsers}" var="sUser">

			<div class="user-picture" style="margin: auto;width: 1%;height: 100px;">
				<g:if test="${sUser.user.avatar}">
					<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: sUser.user.id])});"></div>
				</g:if>
				<g:else>
					<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
				</g:else>
				<a href="${createLink(controller: 'user', action:'index', params:[username: sUser.username])}">
					${sUser.user.name} ${sUser.user.lastName}
				</a>
			</div>


		</g:each>
			
	</body>
</html>