import 'package:Ticket4U/list_tickets.dart';
import '../models/tickets.dart';
import 'package:mobx/mobx.dart';
import '../repositories/ticket_repository.dart';

//flutter pub run build_runner build
part 'mixin_ticket.g.dart';

class TicketView = _TicketView with _$AfazerStore;

abstract class _TicketView {
  _TicketView() {
    _loadTickets();
  }

  TicketRepository repository = TicketRepository();

  @observable
  ObservableList<Ticket> listAllTickets = ObservableList();

  @observable
  ObservableFuture<List<Ticket>> obsFuture = ObservableFuture.value([]);

  @action
  Future<void> _loadTickets() async {
    final futureList = repository.listTickets();
    obsFuture = ObservableFuture(futureList);
    final tickets = await futureList;
    listAllTickets.addAll(tickets);
  }

  @action
  Future<Ticket> findTicketById(String ticketId) async {
    return await repository.findTicketById(ticketId);
  }
}
