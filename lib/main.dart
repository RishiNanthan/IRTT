import 'package:flutter/material.dart';
import 'screens/home.dart';


void main() => runApp(Irtt());

class Irtt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IRTT",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: "IRTT",),
    );
  }
}

