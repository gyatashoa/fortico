import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/screen/add_sensor.dart';
import 'package:fortico/screen/home.dart';
import 'package:fortico/screen/sign_in.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    print(routeSettings.name);
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case addSensor:
        return MaterialPageRoute(builder: (_) => const AddSensor());
      default:
        throw Exception('Unemplemented Route');
    }
  }
}
