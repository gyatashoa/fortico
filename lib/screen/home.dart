// ignore_for_file: use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/auth_service.dart';
import 'package:fortico/services/database_service.dart';
import 'package:fortico/utils/utils.dart';
import 'package:fortico/widgets/tank_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String get home => '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future onLogout() async {
    await getIt<AuthService>().logout();
    Navigator.pushReplacementNamed(context, signInRoute);
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
      body: StreamBuilder<DatabaseEvent>(
          stream: getIt<DatabaseService>().getReadings(),
          builder: (_, data) {
            if (data.hasError) {
              return Text('Error');
            }
            if (data.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (data.hasData) {
              var docs = data.data!.snapshot.children;
              var doc = docs.first;
              double level =
                  (double.parse((doc.value as Map)['level']) / 200) * 100;
              return Align(
                  alignment: Alignment.center,
                  child: TankWidget(
                    level: level,
                  ));

              // return Text(data.data);
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, history);
        },
        child: const Icon(Icons.history),
      ),
    );
  }
}
