<g:if test="${member.avatar}">
	<div class="new-member-photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: member.id])});"></div>
</g:if>
<g:else>
	<div class="new-member-photo glyphicon glyphicon-user" style="padding: 8px;"></div>
</g:else>