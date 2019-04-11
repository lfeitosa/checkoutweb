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
	</style>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />


</head>
<body>

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

<center><button href="/">Inicio</button></center>


</body>
</html>
