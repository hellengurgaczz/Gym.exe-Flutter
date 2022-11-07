import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Ticket {
  String id;
  String ticket;
  String? date = 'A definir';
  String? local = 'A definir';
  int valor;
  String ticket_subtitle;
  String? ticket_desc = '';
  ParseFile image;

  Ticket(
      {required this.id,
      required this.ticket,
      this.date,
      this.local,
      required this.valor,
      required this.ticket_subtitle,
      this.ticket_desc,
      required this.image});
}
