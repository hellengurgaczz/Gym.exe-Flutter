import 'package:Ticket4U/models/loginController.dart';
import 'package:Ticket4U/models_views/user_view.dart';

import './list_tickets.dart';
import './register_login.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import '../constants/constants.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  UserView userView = UserView();
  String error = "";

  // Controllers de texto
  LoginController loginController = LoginController(
      email: TextEditingController(), senha: TextEditingController());

  sign_in_verify(context) async {
    setState(() {
      error = "";
    });

    var response = await userView.verifyLogin(
        loginController.email.text, loginController.senha.text);

    if (response == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListTickets()),
      );
    } else {
      setState(() {
        error =
            "Login ou senha incorretos! Verifique os campos e tente novamente";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(home_screen_background),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  InkWell(
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(text_sign_in.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(text_register.toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterLogin()),
                        )),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.alternate_email,
                            color: Colors.purple,
                          ),
                        ),
                        Expanded(
                          // ignore: sort_child_properties_last
                          child: TextField(
                            controller: loginController.email,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              labelText: text_email,
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              )),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15, bottom: 30),
                        child: Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: loginController.senha,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            labelText: text_password,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )),
                          ),
                          obscureText: true,
                        ),
                      )
                    ],
                  ),
                  error.length > 1
                      ? Text(
                          error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 10),
                        )
                      : Container(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple,
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Typicons.social_twitter,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple,
                            ),
                          ),
                          child: const Icon(
                            Typicons.social_youtube,
                            color: Colors.purple,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (() => sign_in_verify(context)),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
