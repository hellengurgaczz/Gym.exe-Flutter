import 'package:Ticket4U/models/purchase.dart';
import 'package:Ticket4U/repositories/purchases_repository.dart';
import 'package:mobx/mobx.dart';

part 'mixin_purchase.g.dart';

// ignore: library_private_types_in_public_api
class PurchaseView = _PurchaseView with _$PurchaseView;

abstract class _PurchaseView {
  PurchasesRepository repository = PurchasesRepository();

  @action
  Future<bool> savePurchase(Purchase purchase) async {
    return await repository.savePurchase(Purchase(
        nome_comprador: purchase.nome_comprador,
        email: purchase.email,
        idTicket: purchase.idTicket,
        cpf_comprador: purchase.cpf_comprador,
        numero_ingressos: purchase.numero_ingressos,
        numero_cartao: purchase.numero_cartao,
        validade_cartao: purchase.validade_cartao,
        cvv_cartao: purchase.cvv_cartao,
        titular_cartao: purchase.titular_cartao,
        documento_titular: purchase.documento_titular));
  }
}
