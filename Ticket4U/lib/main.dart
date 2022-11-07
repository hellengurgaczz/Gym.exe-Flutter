import 'package:flutter/material.dart';
import './views/home_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tittle_app,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const Splash(),
    );
  }
}
