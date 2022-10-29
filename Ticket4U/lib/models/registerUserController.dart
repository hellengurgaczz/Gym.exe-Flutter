import 'package:flutter/cupertino.dart';

class RegisterUserController {
  TextEditingController nome;
  TextEditingController email;
  TextEditingController cpf;
  TextEditingController senha;

  RegisterUserController({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.senha,
  });
}
