import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  late FirebaseDatabase _firebaseDatabase;
  final refName = 'readings';

  DatabaseService() {
    _firebaseDatabase = FirebaseDatabase.instance;
  }

  Future getReadings() async {
    var data = await _firebaseDatabase.ref('readings').get();
    print(data.children);
  }
}
