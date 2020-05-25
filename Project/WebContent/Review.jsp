<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Contact</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
input, select {
	height: 45px;
	width: 250px;
}

form .submit {
	background-color: #ff5722;
	background-color: transparent;
	color: #fff;
	letter-spacing: 2px;
	height: 30px;
	width: 50px;
	margin: 20px;
	transition: 0.4s ease;
	margin: 20px;
}

form {
	width: 320px;
	height: 620px;
	background: #fff;
	color: #000;
	top: 65%;
	left: 50%;
	position: absolute;
	transform: translate(-150%, -50%);
	box-sizing: border-box;
}

form.submit:hover {
	background-color: #f44336;
	cursor: pointer;
}

table {
	display: block;
	font-family: sans-serif;
	-webkit-font-smoothing: antialiased;
	font-size: 150%;
	overflow: auto;
	min-width: 700px;
	border-collapse: collapse;
	font-weight: bold;
	color: @darkGrey;
	width: 200px;
	height: 700px;
	margin-left: 700px;
	margin-top: 50px;
}

button {
	width: 80%;
	height: 50px;
	padding: 10;
	font-size: 20px;
	color: #fff;
	text-align: center;
	border: 0;
	border-radius: 5px;
	cursor: pointer;
	outline: 0;
	background-color: white;
	color: black;
	border: 2px solid #FF5733;
}

button:hover {
	background-color: #FF5733; /* Green */
	color: white;
}

th {
	background-color: #FF5733;
	color: white;
	font-weight: normal;
	padding: 20px 30px;
	text-align: center;
	color: white;
}

td {
	background-color: rgb(238, 238, 238);
	color: rgb(111, 111, 111);
	padding: 20px 30px;
}

.checked {
	color: orange;
}

.loginbox input {
	width: 100%;
	margin-bottom: 20px;
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
	<div class="box">
		<form method="post" action="ReviewsServlet">
			<h1>REVIEW GROUND</h1>
			<h3>Ground ID</h3>
			<input type="text" name="id" placeholder="Enter Ground ID">
			<h3>Rating</h3>

			<select name="rating">
				<option value="1">1 Stars</option>
				<option value="2">2 Stars</option>
				<option value="3">3 Stars</option>
				<option value="4">4 Stars</option>
				<option value="5">5 Stars</option>
			</select><br>
			<br>
			<button type="submit" name="rev" value="1">Review Ground</button>
			<br>
			<br>
			<button type="submit" name="rev" value="2">View Reviews</button>
			<h4>
				<%
					String msg = (String) request.getAttribute("msg");
					if (msg != null)
						out.println(msg);
				%>
			</h4>
		</form>
	</div>

	<%
		ArrayList<Integer> gid = (ArrayList<Integer>) request.getAttribute("gid");
		ArrayList<Integer> review = (ArrayList<Integer>) request.getAttribute("review");
		if (gid != null) {
	%><table>
		<tr>
			<th>Ground ID</th>
			<th>Average Ground Rating</th>

		</tr>
		<%
			for (int i = 0; i < gid.size(); i++) {
		%>

		<tr>
			<td>
				<%
					out.print(gid.get(i));
				%>
			</td>
			<td>
				<%
					for (int j = 0; j < review.get(i); j++) {
				%> <span class="fa fa-star checked"></span> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>
</body>
</html>