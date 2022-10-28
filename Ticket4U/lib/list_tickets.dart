// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:Ticket4U/buy_ticket.dart';
import 'package:Ticket4U/details_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './models_views/ticket_view.dart';

class ListTickets extends StatelessWidget {
  TicketView ticketView = TicketView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imgs/background.jpg"), fit: BoxFit.cover)),
      child: Container(
        child: Observer(builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10.0),
            itemCount: ticketView.listaTickets.length,
            itemBuilder: (context, index) {
              final ticket = ticketView.listaTickets[index];
              return Observer(builder: (_) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsTicket()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          child: Image.network(
                            ticket.image.url as String,
                            height: 150,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        ListTile(
                          title: Text(ticket.ticket,
                              style:
                                  TextStyle(fontSize: 35, color: Colors.purple),
                              textAlign: TextAlign.center),
                          subtitle: Text(ticket.ticket_subtitle,
                              style: TextStyle(color: Colors.black26),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            ticket.ticket_desc!,
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  minimumSize: const Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BuyTicket(ticketId: ticket.id)),
                                  );
                                },
                                child: const Text("Comprar")),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        }),
      ),
    ));
  }
}
