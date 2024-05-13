import 'package:flutter/material.dart';
import 'package:tugas_akhir/screen/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Akhir',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: LoginPage(),
    );
  }
}