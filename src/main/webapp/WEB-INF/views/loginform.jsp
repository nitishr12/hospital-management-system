<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">


<head>

	<meta charset="utf-8">
	<title>Login Page</title>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <!-- BOOTSTRAP STYLES-->
    <spring:url value="/resources/assets/css/bootstrap.css" var="CSS12" />
    <link href="${CSS12}" rel="stylesheet" />

<spring:url value="/resources/assets/css/css_login/animate_login.css" var="CSS" />
<link href="${CSS}" rel="stylesheet" />

<spring:url value="/resources/assets/css/css_login/style_login.css" var="CSS1" />
<link href="${CSS1}" rel="stylesheet" />

    <spring:url value="/resources/assets/js/validate.js" var="jslogin" />
    <script src="${jslogin}"></script>



<spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" var="js" />
<script src="${js}"> </script>
    
    <spring:url value="/resources/assets/img/img1/photo_bg.jpg" var="login_bg" />

<style type="text/css">
body {
	background: url(${login_bg}) no-repeat center center fixed;
	background-size: cover;
	font-size: 16px;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	margin: 0;
	color: #666;
}
</style>


<script>
$('.main_block').click(function(e) {
	var $container = $(this), 
		top = e.type == 'click' ? -$container.height() : 0;
	$container.find('.slide').stop(true).animate({
		top: top
	})
})

</script>
</head>

<body>
<div style="height:100px;">

</div>

		<div class="login-box animated fadeInUp ">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
		    <form:form action="loginform.html"  name="loginform" onsubmit="return validateLogin()" commandName="loginForm">
			<label for="username">Username</label>
			<br/>
			<form:input name="username" class="input-txt" id="username" path="userName" />
			<br/>
			<label for="password">Password</label>
			<br/>
			<form:password name="password" class="input-txt" id="password" path="password" />
			<br/>
			<button type="submit">Sign In</button><br>
						<br><form:errors id="error_msg" style="color:red;font-size:12px;"
				path="userName" />
						</form:form>
			
			<br/>
			<a href="passwordReset.html"><b><p class="small">Forgot your password?</p></b></a>
	</div>

		
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>








</html>