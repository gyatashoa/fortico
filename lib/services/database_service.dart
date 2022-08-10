import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  late FirebaseDatabase _firebaseDatabase;
  final refName = 'readings';

  DatabaseService() {
    _firebaseDatabase = FirebaseDatabase.instance;
  }

  Stream<DatabaseEvent> getReadings() async* {
    var ref = _firebaseDatabase.ref('readings');
    // print(data.children.first.value);
    // return data.children;
    yield* ref.onValue;
  }
}
