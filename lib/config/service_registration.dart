import 'package:fortico/services/auth_service.dart';
import 'package:fortico/services/database_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<DatabaseService>(DatabaseService());
}