import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fortico/config/route_settings.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  bool isLoggedIn = getIt<AuthService>().currentUser != null;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
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
      initialRoute: isLoggedIn ? homeRoute : signInRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
