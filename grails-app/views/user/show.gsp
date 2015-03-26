
<html>
<head>
	<meta name="layout" content="main">
<style>
	img.avatar {
  width: 6.0em;
  height: 7.5em;
}
img.avatar_small {
  width: 4em;
  height: 5em;
}

img.avatar_tiny {
  width: 2em;
  height: 2.5em;
}
</style>
</head>
<body>


asdasdasdasd
<g:if test="${user.avatar}">
  <img class="avatar" src="${createLink(controller:'user', action:'avatar_image')}" />
</g:if>

</body>
</html>