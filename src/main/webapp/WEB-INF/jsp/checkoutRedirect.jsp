
<html>
<head>

    <script src="https://secure.mlstatic.com/sdk/javascript/v1/mercadopago.js"></script>

    <style type="text/css">

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
</head>
<body>

<div id="menu">
    <ul>
        <li><button type="submit">Inicio</button></li>
    </ul>
</div>


<form action="/checkoutRedirect" method="POST" id="pay" name="pay">

    <input type="submit" value="Pagar"/>


</form>
</body>

</html>
