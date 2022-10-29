// ignore_for_file: prefer_const_constructors

import 'package:Ticket4U/constants/constants.dart';

import './buy_ticket.dart';
import './list_tickets.dart';
import 'package:flutter/material.dart';
import '../models/tickets.dart';

class DetailsTicket extends StatefulWidget {
  const DetailsTicket({super.key, required this.ticket});
  final Ticket ticket;

  @override
  // ignore: no_logic_in_create_state
  State<DetailsTicket> createState() => _DetailsTicket(ticket: ticket);
}

class _DetailsTicket extends State<DetailsTicket> {
  _DetailsTicket({required this.ticket});
  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ticket.ticket,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 300,
              height: 200,
              child: Image.network(ticket.image as String),
            ),
            Center(
                child: Text("$text_date ${ticket.date!}",
                    style: TextStyle(color: Colors.white))),
            Center(
                child: Text("$text_location ${ticket.local!}",
                    style: TextStyle(color: Colors.white))),
            Center(
                child: Text("$text_value ${ticket.valor}",
                    style: TextStyle(color: Colors.white))),
            Center(child: Text("", style: TextStyle(color: Colors.white))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuyTicket(ticket: ticket)),
                    );
                  },
                  child: const Text(text_buy_ticket),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 219, 100, 100),
                        minimumSize: Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListTickets()),
                      );
                    },
                    child: const Text(text_to_cancel),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
