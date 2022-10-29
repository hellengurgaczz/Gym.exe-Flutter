import 'package:flutter/cupertino.dart';

class PurchaseController {
  TextEditingController nome_comprador;
  TextEditingController email;
  TextEditingController idTicket;
  TextEditingController cpf_comprador;
  TextEditingController numero_ingressos;
  TextEditingController numero_cartao;
  TextEditingController validade_cartao;
  TextEditingController cvv_cartao;
  TextEditingController titular_cartao;
  TextEditingController documento_titular;

  PurchaseController(
      {required this.nome_comprador,
      required this.email,
      required this.idTicket,
      required this.cpf_comprador,
      required this.numero_ingressos,
      required this.numero_cartao,
      required this.validade_cartao,
      required this.cvv_cartao,
      required this.titular_cartao,
      required this.documento_titular});
}
