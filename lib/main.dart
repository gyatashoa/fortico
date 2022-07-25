import 'package:flutter/material.dart';
import 'package:fortico/screen/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortico',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}
