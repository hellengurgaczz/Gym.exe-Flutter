import 'package:flutter/material.dart';
import './home_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  final keyApplicationId = 'Blhx5C01V0fq73wDrWm5fFKpu9e1HecPNl8yWIdS';
  final keyClientKey = 'uuyBdaQnwEq0TxCvNYYGfJLpzwtCTMN6BpyPSRRV';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  var firstObject = ParseObject('Mensagem')
    ..set('texto', 'Hey ! First message from Flutter. Parse is now connected');
  await firstObject.save();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket4U',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Splash(),
    );
  }
}
