import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            Icon(Icons.school),
            Icon(Icons.notes),
            Icon(Icons.other_houses),
            Icon(Icons.paid),
            Icon(Icons.paid_outlined),
            Icon(Icons.school_outlined),
            Icon(Icons.home_outlined),
            Icon(Icons.other_houses_outlined),
          ],
        )),
      ),
    );
  }
}
