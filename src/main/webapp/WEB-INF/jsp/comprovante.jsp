<!DOCTYPE html>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<html lang="en">
<head>
	<style>
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		td, th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #dddddd;
		}
		body {
			padding:0px;
			margin:0px;
		}

		#menu ul {
			padding:0px;
			margin:0px;
			float: left;
			width: 100%;
			background-color:#EDEDED;
			list-style:none;
			font:80% Tahoma;
		}

		#menu ul li { display: inline; }

		#menu ul li a {
			background-color:#EDEDED;
			color: #333;
			text-decoration: none;
			border-bottom:3px solid #EDEDED;
			padding: 2px 10px;
			float:left;
		}

		#menu ul li a:hover {
			background-color:#D6D6D6;
			color: #6D6D6D;
			border-bottom:3px solid #EA0000;
		}
	</style>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />


</head>
<body>
<div id="menu">
	<ul>
		<form action="/index" method="POST" id="index" name="pay">

			<li><button type="submit">Inicio</button></li>

		</form>

	</ul>
</div>
<table>
	<tr>
		<th>Pagamento</th>
		<th>Descricao</th>
		<th>Status</th>
	</tr>
	<tr>
		<td>${idPagamento}</td>
		<td>${descricao}</td>
		<td>${status}</td>
	</tr>
</table>

<br>
<br>
<br>
<center> <form action="/index" method="POST" id="transparente" name="pay">

	<button type="submit" name="myButton" value="foo" style="width: 200px; height: 50px">Inicio</button>

</form></center>


</body>
</html>
