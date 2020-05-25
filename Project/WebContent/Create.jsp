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
	background-image: url("images/cover.jpg");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.loginbox {
	width: 700px;
	height: 500px;
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
	top: +30px;
	left: calc(70% - 30px);
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
	width: 40%;
	margin-bottom: 5px;
	margin-right: 50px;
}

.loginbox input[type="text"], input[type="password"],input[type="email"] {
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 14px;
}

button {
	background: #D52F18;
	width: 45%;
  	height: 50px;
  	padding: 0;
  	font-size: 20px;
  	color: #fff;
  	text-align: center;
  	border: 0;
 	border-radius: 5px;
  	cursor: pointer; 
  	outline:0;
  
}

.loginbox a {
	text-decoration: none;
	font-size: none;
	line-height: 10px;
	color: darkgray;
}

.loginbox a:hover {
	colour: #ffc107;
}
</style>
</head>
<title>Create User</title>
<link rel="stylesheet" type="text/css" href="style.css">
<body>

	<form method="post" action="CreateUser">
		<div class="loginbox">
			<img src="images/avatar.png" class="avatar">
			<h1>Register Account</h1>
			<p>Enter Email Id</p>	
			<input type="email" name="email" placeholder="Email Id"
			required> 
			<p>Enter Name</p>
			<input type="text" name="fname" placeholder="First Name" required>
			<input type="text" name="lname" placeholder="Last Name" required>
			<p>Enter Phone Number</p>	
			<input type="text" name="phone" placeholder="Phone No"
			required> 
			
			<p>Enter UserName</p>
			<input type="text" name="user" placeholder="Enter Username" required>
			<a href=""><button type="submit">Create</button></a>
			<p>Enter Password</p>	
			<input type="password" name="pwd" placeholder="Enter Password"
			required><a href="Index.jsp"><button type="button">Cancel</button></a>
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
