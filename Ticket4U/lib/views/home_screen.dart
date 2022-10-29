import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_or_register.dart';
import '../constants/constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RegisterOrLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(home_screen_background),
          ),
        ));
  }
}
