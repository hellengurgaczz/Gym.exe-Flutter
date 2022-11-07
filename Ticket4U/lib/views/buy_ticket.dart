import 'package:Ticket4U/constants/constants.dart';
import 'package:Ticket4U/models/purchase.dart';
import 'package:Ticket4U/models/purchaseController.dart';
import 'package:Ticket4U/models_views/purchase_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/tickets.dart';
import './list_tickets.dart';

class BuyTicket extends StatelessWidget {
  BuyTicket({super.key, required this.ticket});
  final Ticket ticket;

  // Controllers de texto
  PurchaseController purchaseController = PurchaseController(
      nome_comprador: TextEditingController(),
      email: TextEditingController(),
      idTicket: TextEditingController(),
      cpf_comprador: TextEditingController(),
      numero_ingressos: TextEditingController(),
      numero_cartao: TextEditingController(),
      validade_cartao: TextEditingController(),
      cvv_cartao: TextEditingController(),
      titular_cartao: TextEditingController(),
      documento_titular: TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    image: const AssetImage(background), fit: BoxFit.cover)),
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Observer(builder: (_) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.add_card_sharp,
                          color: Colors.purple,
                        ),
                        const Text(
                          " $text_buy_tickets",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    Expanded(
                        // ignore: sort_child_properties_last
                        child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: purchaseController.nome_comprador,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: text_name,
                            labelStyle: const TextStyle(color: Colors.white),
                            // ignore: prefer_const_constructors
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: purchaseController.email,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: text_email,
                            labelStyle: const TextStyle(color: Colors.white),
                            // ignore: prefer_const_constructors
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            )),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    )),
                    Expanded(
                        // ignore: sort_child_properties_last
                        child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: purchaseController.cpf_comprador,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: cpf_buyed,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: purchaseController.numero_ingressos,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: " $text_number_tickets",
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    )),
                    InkWell(
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataCard(
                                      ticket: ticket,
                                      purchaseController: purchaseController,
                                    )),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            )));
  }
}

class DataCard extends StatelessWidget {
  DataCard({super.key, required this.ticket, required this.purchaseController});
  final Ticket ticket;
  final PurchaseController purchaseController;
  PurchaseView purchaseView = PurchaseView();

  buyTickets(context) async {
    var response = await purchaseView.savePurchase(Purchase(
        nome_comprador: purchaseController.nome_comprador.text,
        email: purchaseController.email.text,
        idTicket: ticket.id,
        cpf_comprador: int.parse(purchaseController.cpf_comprador.text),
        numero_ingressos: int.parse(purchaseController.numero_ingressos.text),
        numero_cartao: int.parse(purchaseController.numero_cartao.text),
        validade_cartao: purchaseController.validade_cartao.text,
        cvv_cartao: int.parse(purchaseController.cvv_cartao.text),
        titular_cartao: purchaseController.titular_cartao.text,
        documento_titular:
            int.parse(purchaseController.documento_titular.text)));
    print(response);
    if (response == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListTickets()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background), fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.credit_card,
                  color: Colors.purple,
                ),
                Text(
                  " $data_card_tittle",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: TextField(
                controller: purchaseController.numero_cartao,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: card_number,
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.name,
              ),
            )),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    // ignore: sort_child_properties_last
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: purchaseController.validade_cartao,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: validate_number_card,
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 2,
                          ),
                        )),
                    keyboardType: TextInputType.datetime,
                  ),
                )),
                Expanded(
                    // ignore: sort_child_properties_last
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 12),
                  child: TextField(
                    controller: purchaseController.cvv_cartao,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: cvv_card,
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 2,
                          ),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                )),
              ],
            ),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextField(
                controller: purchaseController.titular_cartao,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: name_buy_holder,
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.text,
              ),
            )),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: purchaseController.documento_titular,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: name_card_holder,
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.number,
              ),
            )),
            Row(
              children: [
                InkWell(
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyTicket(ticket: ticket)),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.purple,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (() => buyTickets(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
