import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Animations/FadeAnimation.dart';
import 'package:tt_clario_flutter/Pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4A4E71)),
      ),
      home: LoginPage(),
    );
  }
}

