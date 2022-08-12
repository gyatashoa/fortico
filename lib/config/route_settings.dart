import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/screen/add_sensor.dart';
import 'package:fortico/screen/history.dart';
import 'package:fortico/screen/home.dart';
import 'package:fortico/screen/sign_in.dart';
import 'package:fortico/screen/sign_up.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case addSensor:
        return MaterialPageRoute(builder: (_) => const AddSensor());
      case signUpRoute:
        return MaterialPageRoute(builder: ((_) => const SignUp()));
      case history:
        return MaterialPageRoute(builder: ((_) => const History()));
      default:
        throw Exception('Unemplemented Route');
    }
  }
}
