import 'package:Ticket4U/constants/constants.dart';
import 'package:Ticket4U/list_tickets.dart';
import 'package:Ticket4U/login.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'models/tickets.dart';
import 'models_views/ticket_view.dart';

class BuyTicket extends StatefulWidget {
  BuyTicket({super.key, required this.ticketId});
  final String ticketId;
  //TicketView ticketView = TicketView();
  @override
  State<BuyTicket> createState() => _BuyTicket(ticketId: ticketId);
}

class _BuyTicket extends State<BuyTicket> {
  _BuyTicket({required this.ticketId});
  final String ticketId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          image: DecorationImage(
              image: AssetImage("imgs/background.jpg"), fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
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
                  ' Comprar ingressos',
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
                child: const Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Nome completo*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'E-mail*',
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
                keyboardType: TextInputType.emailAddress,
              ),
            )),
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'CPF do comprador*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Número de ingressos*',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DataCard()),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}

class DataCard extends StatefulWidget {
  const DataCard({super.key});

  @override
  State<DataCard> createState() => _DataCard();
}

class _DataCard extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imgs/background.jpg"), fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.credit_card,
                  color: Colors.purple,
                ),
                const Text(
                  '  Dados do cartão',
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
                child: const Padding(
              padding: EdgeInsets.only(top: 35),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Número do cartão*',
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
                const Expanded(
                    // ignore: sort_child_properties_last
                    child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Data de validade*',
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
                const Expanded(
                    // ignore: sort_child_properties_last
                    child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 12),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'CVV*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Nome do titular*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'CPF/CNPJ do titular*',
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
                  child: Container(
                    padding: EdgeInsets.all(15),
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
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyTicket()),
                      )),
                ),
                const Spacer(),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListTickets()),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
