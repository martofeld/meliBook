<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
  <div>
    <h1 class="info">Profile picture Upload</h1>
    <g:uploadForm action="upload_avatar">
      <label for="avatar">Please, select your profile picture</label><br>
		<div style="margin: auto; height: 40px; width: 374px;">
			<input class="btn btn-success" style="background-color: background-color: rgb(195, 139, 37);" type="file" name="avatar" id="avatar" /> 
			<input type="submit" class="btn btn-success" value="Upload" />
		</div>
    </g:uploadForm>
  </div>
</body>
</html>