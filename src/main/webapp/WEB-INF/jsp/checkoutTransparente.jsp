<!DOCTYPE html>
<html lang="en">
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


<form action="/pagamento" method="POST" id="pay" name="pay">


    <fieldset>
        <ul>
            <li>
                <label for="email">Email</label>
                <input id="email" name="email" value="test_user_84832596@testuser.com" type="email"
                       placeholder="your email"/>
            </li>
            <li>
                <label for="cardNumber">Credit card number:</label>
                <input type="text" id="cardNumber" data-checkout="cardNumber" value="4235647728025682"
                       onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false"
                       onDrag="return false" onDrop="return false" autocomplete=off/>
            </li>
            <li>
                <label for="securityCode">Security code:</label>
                <input type="text" id="securityCode" data-checkout="securityCode" value="123"
                       onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false"
                       onDrag="return false" onDrop="return false" autocomplete=off/>
            </li>
            <li>
                <label for="cardExpirationMonth">Expiration month:</label>
                <input type="text" id="cardExpirationMonth" data-checkout="cardExpirationMonth" value="12"
                       onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false"
                       onDrag="return false" onDrop="return false" autocomplete=off/>
            </li>
            <li>
                <label for="cardExpirationYear">Expiration year:</label>
                <input type="text" id="cardExpirationYear" data-checkout="cardExpirationYear" value="2021"
                       onselectstart="return false" onpaste="return false" onCopy="return false" onCut="return false"
                       onDrag="return false" onDrop="return false" autocomplete=off/>
            </li>
            <li>
                <label for="cardholderName">Card holder name:</label>
                <input type="text" id="cardholderName" data-checkout="cardholderName" value="APRO APRO"/>
            </li>
            <li>
                <label for="docType">Document type:</label>
                <select id="docType" data-checkout="docType">
                    <option value="CPF">CPF</option>
                    <option value="CNPJ">CNPJ</option>


                </select>
            </li>
            <li>
                <label for="docNumber">Document number:</label>
                <input type="text" id="docNumber" data-checkout="docNumber" value="12345678909"/>

            </li>
        </ul>
        <input type="hidden" name="paymentMethodId"/>
        <input type="hidden" name="paymentMethod" id="paymentMethod" value="${paymentMethod}"/>

        <input type="button" value="Pay!" onclick="pagar()"/>
    </fieldset>
</form>
<script type="text/javascript">

    Mercadopago.setPublishableKey("TEST-fff6978f-1006-42f7-9e73-3365574e144b")

    function getBin() {
        var ccNumber = document
            .querySelector('input[data-checkout="cardNumber"]');
        return ccNumber.value.replace(/[ .-]/g, '').slice(0, 6);
    };

    function setPaymentMethodInfo(status, response) {
        if (status == 200) {
            var paymentMethod = document.getElementById("paymentMethod");

            paymentMethod.setAttribute('name', "paymentMethodId");
            paymentMethod.setAttribute('type', "hidden");

            paymentMethod.setAttribute('value', response[0].id);
            var form = document.querySelector('#pay');
            form.appendChild(paymentMethod);
        } else {
            document.querySelector("input[name=paymentMethodId]").value = response[0].id;
        }
    }

    function sdkResponseHandler(status, response) {
        if (status != 200 && status != 201) {
            alert(status);
        } else {
            var form = document.querySelector('#pay');
            var card = document.createElement('input');
            card.setAttribute('name', 'token');
            card.setAttribute('type', 'hidden');
            card.setAttribute('value', response.id);
            form.appendChild(card);


            form.submit();
        }
    };

    function pagar() {

        var form = document.querySelector('#pay');

        Mercadopago.getPaymentMethod({
            "bin" : getBin()
        }, setPaymentMethodInfo);

        Mercadopago.createToken(form, sdkResponseHandler);

    };
</script>
</body>

</html>
