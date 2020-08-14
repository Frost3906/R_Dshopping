<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name = "google-signin-client_id"content = "245346684776-185hq3i3j9iujvt4cl5e42pc4egbh0tg.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>

<title>로그인 결과</title>
</head>
<body>
	<div class="g-signin2" data-onsuccess="onSignIn">
		<h1>로그인 결과 </h1>
		<h3>${result}</h3>	
	</div>
</body>
<script>
	let userInfo='${result}';
	console.log(userInfo);
	
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
</script>
</html>