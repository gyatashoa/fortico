import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late FirebaseAuth _firebaseAuth;

  AuthService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future signin({required String email, required String password}) async {
    try {
      var res = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return res;
    } on FirebaseAuthException catch (err) {
      return err.message;
    } on Exception {
      return 'An error occured while logging in';
    }
  }

  Future signup({required String email, required String password}) async {
    try {
      var res = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return res;
    } on FirebaseAuthException catch (err) {
      return err.message;
    } on Exception {
      return 'An error occured while signing in';
    }
  }

  Future logout() {
    return _firebaseAuth.signOut();
  }
}
