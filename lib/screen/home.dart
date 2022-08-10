// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String get home => '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future onLogout() async {
    await getIt<AuthService>().logout();
    Navigator.pushReplacementNamed(context,signInRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortico'),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(),
              onPressed: onLogout,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addSensor);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
