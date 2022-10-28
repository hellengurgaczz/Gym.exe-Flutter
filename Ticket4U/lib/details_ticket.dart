// ignore_for_file: prefer_const_constructors

import 'package:Ticket4U/buy_ticket.dart';
import 'package:Ticket4U/list_tickets.dart';
import 'package:flutter/material.dart';
import './constants/constants.dart';

class DetailsTicket extends StatefulWidget {
  const DetailsTicket({super.key});

  @override
  State<DetailsTicket> createState() => _DetailsTicket();
}

class _DetailsTicket extends State<DetailsTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("imgs/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(ticket1,
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
              child: Image.asset("imgs/ticket1.jpg"),
            ),
            Container(
              child: const Center(
                  child: Text("Data: " + ticket1_data,
                      style: TextStyle(color: Colors.white))),
            ),
            Container(
              child: const Center(
                  child: Text("Local: " + ticket_local,
                      style: TextStyle(color: Colors.white))),
            ),
            Container(
              child: const Center(
                  child: Text("Valor: " + ticket1_valor,
                      style: TextStyle(color: Colors.white))),
            ),
            Container(
              child: const Center(
                  child: Text("", style: TextStyle(color: Colors.white))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Comprar ingresso'),
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
                          builder: (context) => const BuyTicket()),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                    child: const Text('Cancelar'),
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
