class User {
  String? id;
  String nome;
  String email;
  int cpf;
  String senha;

  User({
    this.id,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.senha,
  });
}
