class Compras {
  String? id;
  String nome_comprador;
  String email;
  String idTicket;
  int numero_ingressos;
  int numero_cartao;
  String validade_cartao;
  int cvv_cartao;
  String titular_cartao;
  int documento_titular;

  Compras(
      {this.id,
      required this.nome_comprador,
      required this.email,
      required this.idTicket,
      required this.numero_ingressos,
      required this.numero_cartao,
      required this.validade_cartao,
      required this.cvv_cartao,
      required this.titular_cartao,
      required this.documento_titular});
}
