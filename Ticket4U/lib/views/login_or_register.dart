import '../constants/constants.dart';
import './login.dart';
import './register_login.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegiRegisterOrLoginsterLogin();
}

class _RegiRegisterOrLoginsterLogin extends State<RegisterOrLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        // ignore: avoid_unnecessary_containers
        Container(
            child: Center(
          child: SizedBox(
            width: 500,
            height: 300,
            child: Image.asset(home_screen_background),
          ),
        )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              minimumSize: const Size(150, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: const Text(text_sign_in),
        ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterLogin()),
              );
            },
            child: const Text(text_register),
          ),
        )
      ]),
    );
  }
}
