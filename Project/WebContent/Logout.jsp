<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<style>
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
.d {
	width: 700px;
	height: 500px;
	background: #ABEBC6;
	color: #000;
	top: 40%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 30px 30px;

}
</style>
</head>
<body>
	<form method="post" action="BackServlet">
		<div class="d"><%
				
				String msg= (String)request.getAttribute("amt"); 
				if(msg!=null){
				
				%>
				<h3><%=msg %></h3>
				<br><br>
				<h2>Successful Registration</h2>
				<br><br>
				<button>Back</button>
				<br><br>
				<a href ="Index.jsp"><button>Logout</button>
				</a><%
				}
			%></div>
	</form>		
</body>
</html>