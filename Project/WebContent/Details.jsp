<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"
	import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Time and Date</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.details {
	width: 320px;
	height: 420px;
	background: #ABEBC6;
	color: #000;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 70px 30px;
}

.details input {
	width: 100%;
	margin-bottom: 20px;
}

.details input[type="date"], select {
	border: none;
	border-bottom: 1px solid #fff;
	background: #fff;
	outline: none;
	height: 40px;
	color: #000 font-size: 16px;
}

button {
	width: 100%;
	height: 50px;
	padding: 10;
	font-size: 20px;
	color: #fff;
	text-align: center;
	border: 0;
	border-radius: 5px;
	cursor: pointer;
	outline: 0;
	background: #F02C2C;
}
}
</style>
</head>
<body>
	<form method="post" action="FinalServlet">
		<div class="container-fluid">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Sport Venue Reservation</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="LogPage.jsp">HOME</a></li>
						<li><a href="Indoor.jsp">INDOOR</a></li>
						<li><a href="Outdoor.jsp">OUTDOOR</a></li>
						<li><a href="Review.jsp">REVIEWS</a></li>
						<li><a href="Cancel.jsp">CANCEL BOOKING</a></li>
						<li><a href="Index.jsp">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
		</div>

		<div class="details">
			<h1>Register</h1>
			<p>Enter Date</p>
			<input type="date" name="date" required>
			<p>Enter Time</p>
			<select name="time">
				<option value="12:00">12:00 Hrs</option>
				<option value="13:00">13:00 Hrs</option>
				<option value="14:00">14:00 Hrs</option>
				<option value="15:00">15:00 Hrs</option>
				<option value="16:00">16:00 Hrs(Peak Hour)</option>
				<option value="17:00">17:00 Hrs(Peak Hour)</option>
				<option value="18:00">18:00 Hrs(Peak Hour)</option>
				<option value="19:00">19:00 Hrs(Peak Hour)</option>
				<option value="20:00">20:00 Hrs(Peak Hour)</option>
				<option value="21:00">21:00 Hrs(Peak Hour)</option>
			</select> <br>
			<br>
			<button type="submit">Confirm</button>
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