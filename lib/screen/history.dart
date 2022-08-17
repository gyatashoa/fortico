import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fortico/config/service_registration.dart';
import 'package:fortico/services/database_service.dart';
import 'package:fortico/utils/utils.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: StreamBuilder<DatabaseEvent>(
          stream: getIt<DatabaseService>().getReadings(),
          builder: (_, data) {
            if (data.hasError) {
              return const Center(child: Text('Error'));
            }
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (data.hasData) {
              var docs = data.data!.snapshot.children.toList();
              docs = docs.reversed.toList();
              return ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      title: Text(Utils.getPercentage(
                          (docs[index].value as Map)['level'])),
                      leading: const Icon(Icons.water_drop),
                      subtitle:
                          Text(Utils.convertTime(int.parse(docs[index].key!))),
                    )),
                itemCount: docs.length,
              );
              // return Text(data.data);
            }
            return Container();
          }),
    );
  }
}
