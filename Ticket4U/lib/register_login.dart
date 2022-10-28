import 'package:Ticket4U/list_tickets.dart';
import 'package:Ticket4U/login.dart';
import 'package:flutter/material.dart';

class RegisterLogin extends StatefulWidget {
  const RegisterLogin({super.key});

  @override
  State<RegisterLogin> createState() => _RegisterLogin();
}

class _RegisterLogin extends State<RegisterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imgs/background.jpg"), fit: BoxFit.cover)),
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
                  '  Cadastre-se',
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
                child: const Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Nome completo*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'E-mail*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'CPF*',
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
            const Expanded(
                // ignore: sort_child_properties_last
                child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Senha*',
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
                child: const Text('Cadastrar'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListTickets()),
                  );
                },
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
                            '  Já tem login? Clique aqui!',
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
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          )),
                    )))
          ],
        ),
      ),
    ));
  }
}
