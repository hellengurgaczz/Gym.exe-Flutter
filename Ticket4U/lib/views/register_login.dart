import 'package:Ticket4U/models/registerUserController.dart';
import 'package:Ticket4U/models_views/user_view.dart';

import '../models/user.dart';
import './list_tickets.dart';
import './login.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class RegisterLogin extends StatelessWidget {
  RegisterLogin({super.key});
  UserView userView = UserView();

  // Controllers de texto
  RegisterUserController registerUserController = RegisterUserController(
      nome: TextEditingController(),
      email: TextEditingController(),
      cpf: TextEditingController(),
      senha: TextEditingController());

  registerLogin(context) async {
    var response = await userView.registerUser(User(
        nome: registerUserController.nome.text,
        email: registerUserController.email.text,
        cpf: int.parse(registerUserController.cpf.text),
        senha: registerUserController.senha.text));
    print(response);
    if (response == true) {
      print('deu');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListTickets()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background), fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(
                  Icons.person_add_alt,
                  color: Colors.purple,
                ),
                const Text(
                  " ${text_register}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                controller: registerUserController.nome,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: text_name,
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.name,
              ),
            )),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextField(
                controller: registerUserController.email,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "$text_email*",
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            )),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                controller: registerUserController.cpf,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: text_cpf,
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.number,
              ),
            )),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextField(
                controller: registerUserController.senha,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "$text_password*",
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    )),
                keyboardType: TextInputType.datetime,
              ),
            )),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {
                  registerLogin(context);
                },
                child: const Text(text_to_register),
              ),
            ),
            Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.people_alt_outlined,
                            color: Colors.purple,
                          ),
                          const Text(
                            " $text_has_login",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          )),
                    )))
          ],
        ),
      ),
    ));
  }
}
