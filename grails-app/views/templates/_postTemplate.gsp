<g:each in="${posts}" var="post">
	<div class="post">
		<div class="user-picture">
			<g:if test="${post.user.avatar}">
				<div class="photo" style="background-image: url(${createLink(controller:'user', action:'avatar_image_another', params: [user: post.user.id])});"></div>
			</g:if>
			<g:else>
				<div class="photo glyphicon glyphicon-user" style="font-size: 33px; padding: 14px;"></div>
			</g:else>
		</div>
		<div class="content">
			<span class="user-post">${post.user.name}</span>
			<a href="${createLink(controller: 'post', action: 'view', id: post.id)}"><span class="text">${post.content}</span></a>
		</div>
		<div class="info-post">
			<div class="likes">
				<div id="likeCounter${post.id}" onclick="addLike(${post.id})" class="no-like" id="likeAdder${post.id}">${post.likes.size()}</div>
			</div>
		</div>
	</div>
</g:each>