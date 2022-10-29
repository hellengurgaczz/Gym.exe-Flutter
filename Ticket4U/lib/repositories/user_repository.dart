import 'package:Ticket4U/models/user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<bool> saveUser(User user) async {
    var parser = ParseObject('Users')
      ..set('cpf', user.cpf)
      ..set('senha', user.senha)
      ..set('nome', user.nome)
      ..set('email', user.email);

    final ParseResponse response = await parser.save();

    if (response.success) {
      return true;
    }

    return false;
  }

  Future<bool> verifyLogin(String email, String senha) async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Users'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;

      for (ParseObject object in objects) {
        if (object.get<String>('email') == email &&
            object.get<String>('senha') == senha) {
          return true;
        }
      }
    }
    return false;
  }
}
