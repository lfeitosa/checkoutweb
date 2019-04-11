
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
        <form action="/index" method="POST" id="index" name="pay">

        <li><button type="submit">Inicio</button></li>

        </form>

    </ul>
</div>
<center><table>
    <tr>
        <th><img width="60%" src="https://cdn11.bigcommerce.com/s-dl3hn2bnjn/images/stencil/500x659/products/305/1144/8164ScXLNCL._SL1500___82683.1539337049.jpg" usemap="#shape"  /> <br>
            <h1>FIFA 2019</h1>
            <h2> Valor 100.00</h2></th>
        <th>
            <form action="/" method="POST" id="redirect" name="pay">

                <button type="submit" name="myButton" value="foo" style="width: 200px; height: 50px">Transparente</button>

            </form>
            <br>
            <br>
            <br>
            <br>
            <br>
            <form action="/checkoutRedirect" method="POST" id="transparente" name="pay">

                <button type="submit" name="myButton" value="foo" style="width: 200px; height: 50px">Redirect</button>

            </form>
        </th>
    </tr>
    <tr>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
    </tr>
</table>

</center>

</body>

</html>
