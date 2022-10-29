// ignore_for_file: prefer_const_constructors

import '../models_views/ticket_view.dart';
import './buy_ticket.dart';
import './details_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/constants.dart';

class ListTickets extends StatelessWidget {
  TicketView ticketView = TicketView();

  ListTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background), fit: BoxFit.cover)),
      child: Observer(builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: ticketView.listAllTickets.length,
          itemBuilder: (context, index) {
            final ticket = ticketView.listAllTickets[index];
            return Observer(builder: (_) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsTicket(ticket: ticket)),
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
                                          BuyTicket(ticket: ticket)),
                                );
                              },
                              child: const Text(text_buy)),
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
    ));
  }
}
