import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../models/tickets.dart';

class TicketRepository {
  Future<List<Ticket>> listTickets() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Tickets'));
    final ParseResponse apiResponse = await queryTodo.query();

    List<Ticket> lista = [];
    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;

      for (ParseObject object in objects) {
        Ticket _ticket = Ticket(
            id: object.objectId.toString(),
            ticket: object.get<String>('ticket')!,
            date: object.get<String>('data')!,
            local: object.get<String>('local')!,
            valor: object.get<int>('valor')!,
            ticket_subtitle: object.get<String>('ticket_subtitle')!,
            ticket_desc: object.get<String>('ticket_desc')!,
            image: object.get<ParseWebFile>('image')!);

        lista.add(_ticket);
      }

      return lista;
    } else {
      return [];
    }
  }

  Future<Ticket> findTicketById(String ticketId) async {
    var ticket = ParseObject('Tickets')..objectId = ticketId;

    Ticket _ticket = Ticket(
        id: ticket.objectId.toString(),
        ticket: ticket.get<String>('ticket')!,
        date: ticket.get<String>('data')!,
        local: ticket.get<String>('local')!,
        valor: ticket.get<int>('valor')!,
        ticket_subtitle: ticket.get<String>('ticket_subtitle')!,
        ticket_desc: ticket.get<String>('ticket_desc')!,
        image: ticket.get<ParseWebFile>('image')!);

    return _ticket;
  }
}
