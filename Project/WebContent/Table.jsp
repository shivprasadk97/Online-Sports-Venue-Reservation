<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"
	import="java.util.List"%>
<%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Table</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
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
	width: 700px;
	height: 700px;
	margin: 50px auto;
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
</style>
</head>
<body>
	<form method="post" action="RegisterServlet">
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
		<h3 align="center">Amount will vary in peak hours(amount*1.5)</h3>
		<table>
			<tr>
				<th>ID</th>
				<th>Sport</th>
				<th>Location</th>
				<th>Amount</th>
				<th>Register</th>
			</tr>

			<%
				ArrayList<Integer> gid = new ArrayList<>();
				ArrayList<String> sport = new ArrayList<>();
				ArrayList<String> location = new ArrayList<>();
				ArrayList<String> price = new ArrayList<>();
				price = (ArrayList<String>) request.getAttribute("price");
				gid = (ArrayList<Integer>) request.getAttribute("gid");
				location = (ArrayList<String>) request.getAttribute("location");
				sport = (ArrayList<String>) request.getAttribute("sport");

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
						out.print(sport.get(i));
					%>
				</td>
				<td>
					<%
						out.print(location.get(i));
					%>
				</td>
				<td>
					<%
						out.print(price.get(i));
					%>
				</td>
				<%
					Integer id = gid.get(i);
				%>
				<td><button type="submit" name="gid" value="<%=id%>">Register</button></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</body>
</html>