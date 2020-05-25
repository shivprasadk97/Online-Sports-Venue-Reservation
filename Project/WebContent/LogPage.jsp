<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	/* The image used */
	background-image: url("images/backcover.jpg");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- Nav Bar Start -->
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
					<li></li>
				</ul>
			</div>
		</nav>
		<!-- Nav Bar End -->
		<!-- Carousel Start -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/img1.jpg" alt="Los Angeles"
						style="width: 100%; height: 500px">
				</div>

				<div class="item">
					<img src="images/img2.jpg" alt="Chicago"
						style="width: 100%; height: 500px">
				</div>

				<div class="item">
					<img src="images/img3.jpg" alt="Chicago"
						style="width: 100%; height: 500px">
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel End -->

		<!-- Extra designs-->
	</div>
</body>
</html>