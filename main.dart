import 'package:flutter/material.dart';
import 'login.dart'; // Add this import statement for the login.dart file
// ignore: unused_import
import 'registration.dart';
// ignore: unused_import
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Set LoginScreen as the home widget
    );
  }
}
