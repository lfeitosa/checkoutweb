package com.mkyong;

import java.util.Map;

import com.mercadopago.MercadoPago;
import com.mercadopago.exceptions.MPException;
import com.mercadopago.resources.Payment;
import com.mkyong.DTO.CardToken;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class WelcomeController {


    @RequestMapping("/")

    public String welcome(Map<String, Object> model) {

        Payment payment = new Payment();
        model.put("paymentMethod", payment);
        return "welcome";
    }



    @RequestMapping(value = "/pagamento", method = RequestMethod.POST)
    String checkoutTransparenteWeb(
            @ModelAttribute CardToken cardToken, Map<String, Object> model,
            @RequestParam(value = "acesstoken", defaultValue = "TEST-4503850346864580-032710-9fb9fc100f9c93d738833f091d3509fb-420290877") String acessToken,
            @RequestParam(value = "itemid", defaultValue = "1234") String itemId,
            @RequestParam(value = "titulo", defaultValue = "Produto Teste") String titulo,
            @RequestParam(value = "price", defaultValue = "45") String price,
            @RequestParam(value = "quantity", defaultValue = "2") String quantity,
            @RequestParam(value = "name", defaultValue = "Lucas") String name,
            @RequestParam(value = "surname", defaultValue = "Feitosa") String surname,
            @RequestParam(value = "email", defaultValue = "lucas.feitosa@mercadobackoffice.com") String email,
            @RequestParam(value = "ddd", defaultValue = "11") String ddd,
            @RequestParam(value = "telefone", defaultValue = "981896893") String telefone,
            @RequestParam(value = "tipodoc", defaultValue = "CPF") String tipoDoc,
            @RequestParam(value = "doc", defaultValue = "42789874808") String documento,
            @RequestParam(value = "rua", defaultValue = "Rua teste") String rua,
            @RequestParam(value = "numero", defaultValue = "1234") String numero,
            @RequestParam(value = "cep", defaultValue = "06182060") String cep,
            @RequestParam(value = "bandeira", defaultValue = "visa") String bandeira,
            @RequestParam(value = "backurl", defaultValue = "") String back_url
    ) {
        try {


            JSONObject json = new JSONObject(criarCheckoutTransparenteApp(acessToken, cardToken, itemId, titulo, Float.parseFloat(price), Integer.parseInt(quantity), name, surname, email, ddd, telefone, tipoDoc, documento, rua, numero, cep, bandeira, back_url));
            System.out.println(json.toString());

            model.put("descricao", json.getString("description"));
            model.put("status", json.getString("status"));
            model.put("idPagamento", json.getInt("id"));



        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }


        return "comprovante";

    }

    public String criarCheckoutTransparenteApp(String acessToken, CardToken cardToken, String itemid, String titulo, Float price, int quantity, String name, String surname, String email, String ddd, String telefone, String tipodoc, String doc
            , String rua, String numero, String cep, String bandeira, String back_url) throws MPException {


        MercadoPago.SDK.setAccessToken(acessToken);


        Payment payment = new Payment();
        payment.setTransactionAmount(price)
                .setToken(cardToken.getToken())
                .setDescription(titulo)
                .setInstallments(1)
                .setPaymentMethodId(bandeira)
//                .setNotificationUrl(back_url)

                .setPayer(new com.mercadopago.resources.datastructures.payment.Payer()
                        .setEmail(email)
                        .setFirstName(name)
                        .setLastName(surname)
//                        .setPhone(new PayerPhone()
//                                .setAreaCode(ddd)
//                                .setNumber(telefone))

                        .setIdentification(new com.mercadopago.resources.datastructures.payment.Identification()
                                .setType(tipodoc)
                                .setNumber(doc))
                        .setAddress(new com.mercadopago.resources.datastructures.payment.AddressReceiver()
                                .setStreetName(rua)
                                .setStreetNumber(Integer.parseInt(numero))
                                .setZipCode(cep)));

        payment.save();


        System.out.println(payment.getLastApiResponse());
        return payment.getLastApiResponse().getStringResponse();

    }


}