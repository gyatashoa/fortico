import 'package:flutter/material.dart';
import 'package:fortico/config/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String get home => '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortico'),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(),
              onPressed: () {},
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
          Navigator.pushNamed(context,addSensor);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
