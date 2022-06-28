import 'package:api/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  DatabaseService databaseService = DatabaseService();
  final _auth = FirebaseAuth.instance;
  User? user;

  Future registerWithEmailPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
      user = result.user;
      await databaseService.updateUserData("Rahul", "GTA 3", 57);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signinWithEmailPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
      user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
