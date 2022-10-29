import 'package:flutter/material.dart';
import './list_tickets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: ListTickets());
  }
}
