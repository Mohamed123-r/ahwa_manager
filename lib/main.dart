import 'package:ahwa/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SmartAhwaManagerApp());
}

class SmartAhwaManagerApp extends StatelessWidget {
  const SmartAhwaManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const HomeScreen(),
    );
  }
}
