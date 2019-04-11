package com.mkyong;

import java.util.Map;

import com.mercadopago.MercadoPago;
import com.mercadopago.exceptions.MPException;
import com.mercadopago.resources.Payment;
import com.mercadopago.resources.Preference;
import com.mercadopago.resources.datastructures.preference.*;
import com.mkyong.DTO.CardToken;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class WelcomeController {
    private static final String CLIENT_SECRET = "rPQsiJTic1CCtGn4AdBRqVZAymNnIaLG";
    private static final String CLIENT_ID = "3116859414017650";


    @RequestMapping("/checkoutTransparente")

    public String welcome(Map<String, Object> model) {

        Payment payment = new Payment();
        model.put("paymentMethod", payment);
        return "checkoutTransparente";
    }
    @RequestMapping("/")

    public String index(Map<String, Object> model) {


        return "index";
    }

    @RequestMapping("/redirect")

    public String redirect(Map<String, Object> model) {

        return "checkoutRedirect";
    }


    @RequestMapping(value = "/pagamento", method = RequestMethod.POST)
    String checkoutTransparenteWeb(
            @ModelAttribute CardToken cardToken, Map<String, Object> model,
            @RequestParam(value = "acesstoken", defaultValue = "TEST-4503850346864580-032710-9fb9fc100f9c93d738833f091d3509fb-420290877") String acessToken,
            @RequestParam(value = "itemid", defaultValue = "1234") String itemId,
            @RequestParam(value = "titulo", defaultValue = "Fifa 2019") String titulo,
            @RequestParam(value = "price", defaultValue = "100") String price,
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


            Payment response = criarCheckoutTransparenteApp(acessToken, cardToken, itemId, titulo, Float.parseFloat(price), Integer.parseInt(quantity), name, surname, email, ddd, telefone, tipoDoc, documento, rua, numero, cep, bandeira, back_url);
            System.out.println(response.toString());

            model.put("descricao", response.getDescription());
            model.put("status", response.getStatus());
            model.put("idPagamento", response.getId());


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }


        return "comprovante";

    }

    @RequestMapping("/checkoutRedirect")
    String checkoutTransparente(Map<String, Object> model) {
        try {

            criarCheckoutRedirect(100f);


            return "redirect:" + criarCheckoutRedirect(100f);


        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }


    public String criarCheckoutRedirect(Float price) throws MPException {


        MercadoPago.SDK.setClientSecret(CLIENT_SECRET);
        MercadoPago.SDK.setClientId(CLIENT_ID);

        // Create a preference object
        Preference preference = new Preference();

        // Create an item object
        Item item = new Item();
        item.setId("123341234")
                .setTitle("Fifa 2019")
                .setQuantity(1)
                .setCurrencyId("BRL")
                .setUnitPrice(price);

        com.mercadopago.resources.datastructures.preference.Payer payer = new com.mercadopago.resources.datastructures.preference.Payer();
        payer.setName("Charles")
                .setSurname("Araújo")
                .setEmail("charles@yahoo.com")
                .setDateCreated("2018-06-02T12:58:41.425-04:00")
                .setPhone(new Phone()
                        .setAreaCode("")
                        .setNumber("12331123"))
                .setIdentification(new Identification()
                        .setType("DNI")
                        .setNumber("12345678"))
                .setAddress(new Address()
                        .setStreetName("Estéves Alameda")
                        .setStreetNumber(1779)
                        .setZipCode("2340"));
// ...
        Shipments shipments = new Shipments();
        shipments.setReceiverAddress(new AddressReceiver()
                .setZipCode("2340")
                .setStreetNumber(1779)
                .setStreetName("Estéves Alameda")
                .setFloor("5")
                .setApartment("C"));

        preference.setShipments(shipments);
        preference.setPayer(payer);
        preference.appendItem(item);
// Save and posting preference
        preference.save();

        return preference.getInitPoint();
    }

    public Payment criarCheckoutTransparenteApp(String acessToken, CardToken cardToken, String itemid, String titulo, Float price, int quantity, String name, String surname, String email, String ddd, String telefone, String tipodoc, String doc
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


        return payment.save();


    }


}