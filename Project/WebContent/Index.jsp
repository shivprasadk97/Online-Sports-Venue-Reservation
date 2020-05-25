<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
body, html {
	height: 100%;
}

body {
	/* The image used */
	background-image: url("images/pic2.jpg");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.loginbox {
	width: 320px;
	height: 420px;
	background: #000;
	color: #fff;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 70px 30px;
}

.avatar {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px);
}

h1 {
	margin: 0;
	padding: 0 0 20px;
	text-align: center;
	font-size: 22px;
}

.loginbox p {
	margin: 0;
	padding: 0;
	font-weight: bold;
}

.loginbox input {
	width: 100%;
	margin-bottom: 20px;
}

.loginbox input[type="text"], input[type="password"] {
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
}

button {
  width: 100%;
  height: 50px;
  padding: 0;
  font-size: 20px;
  color: #fff;
  text-align: center;
  
  border: 0;
  border-radius: 5px;
  cursor: pointer; 
  outline:0;
  background: #30C1BD;
}

.loginbox a {
	text-decoration: none;
	font-size: none;
	line-height: 20px;
	color: darkgray;
}

.loginbox a:hover {
	colour: #ffc107;
}
</style>
</head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
<body>

	<form method="post" action="LoginServlet">
		<div class="loginbox">
			<img src="images/User_Circle.png" class="avatar">
			<h1>WELCOME</h1>
			<p>UserName</p>
			<input type="text" name="user" placeholder="Enter Username" required>
			<p>Password</p>	
			<input type="password" name="pwd" placeholder="Enter Password"
			required> 
			<button type="submit">LOGIN</button>
			<h3><a href="Create.jsp"> Create account</a></h3>
			
			<h4>
				<%
				String msg= (String)request.getAttribute("msg"); 
				if(msg!=null)
				out.println(msg);
				%>
			</h4>
		</div>
	</form>
</body>
</html>
