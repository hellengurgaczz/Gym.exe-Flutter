import 'package:Ticket4U/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import '../models/user.dart';

//flutter pub run build_runner build
part 'mixin_user.g.dart';

// ignore: library_private_types_in_public_api
class UserView = _UserView with _$UserView;

abstract class _UserView {
  UserRepository repository = UserRepository();

  @action
  Future<bool> registerUser(User user) async {
    return await repository.saveUser(User(
        nome: user.nome, email: user.email, cpf: user.cpf, senha: user.senha));
  }

  @action
  Future<bool?> verifyLogin(String email, String senha) async {
    return await repository.verifyLogin(email, senha);
  }
}
