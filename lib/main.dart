import 'package:flutter/material.dart';
import 'package:fortico/config/route_settings.dart';
import 'package:fortico/config/routes.dart';

void main() {
  runApp(MyApp(
    isLoggedIn: false,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 
      isLoggedIn?homeRoute:
      signInRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
