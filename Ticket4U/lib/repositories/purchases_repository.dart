import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../models/purchase.dart';

class PurchasesRepository {
  Future<bool> savePurchase(Purchase purchase) async {
    final parser = ParseObject('Compras')
      ..set('nome_comprador', purchase.nome_comprador)
      ..set('email', purchase.email)
      ..set('id_ticket', purchase.idTicket)
      ..set('cpf_comprador', purchase.cpf_comprador)
      ..set('numero_ingressos', purchase.numero_ingressos)
      ..set('numero_cartao', purchase.numero_cartao)
      ..set('validade_cartao', purchase.validade_cartao)
      ..set('cvv_cartao', purchase.cvv_cartao)
      ..set('titular_cartao', purchase.titular_cartao)
      ..set('documento_titular', purchase.documento_titular);

    final ParseResponse response = await parser.save();

    if (response.success) {
      return true;
    }
    return false;
  }
}
