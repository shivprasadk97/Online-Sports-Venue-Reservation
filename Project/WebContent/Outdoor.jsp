<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Outdoor</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
button {
	width: 600px;
	height: 50px;
	padding: 0;
	font-size: 20px;
	color: #fff;
	text-align: center;
	border: 0;
	border-radius: 5px;
	cursor: pointer;
	outline: 0;
	background: #FF5733;
}
</style>
</head>
<body>
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
	<br>
	<div class="card row">
		<form method="Get" action="IndoorServlet">
		<div class="col-sm-6">
			<img class="card-img-top" src="images/clip1.jpg" alt="Card image"
				style="margin-left: 20px;padding: 10px;width: 600px; height: 400px">
			<div class="card-body">
				<button style="margin-left: 20px;padding: 10px;" type="submit" name="name" value="Football">Football</button>
			</div>
		</div>
		</form>
		<form method="Get" action="IndoorServlet">
		<div class="col-sm-6">
			<img class="card-img-top" src="images/clip2.jpg" alt="Card image"
				style="padding: 10px; width: 600px; height: 400px">
			<div class="card-body">
				<button type="submit" name="name" value="Cricket">Cricket</button>
			</div>
		</div>
		</form>

	</div>
</body>
</html>