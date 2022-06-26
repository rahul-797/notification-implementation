import 'package:api/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  User? user;
  late UserModel userModel;

  UserModel _userModelFromUser(User? user) => UserModel(uid: user!.uid);

  Future registerWithEmailPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
      user = result.user;
      return _userModelFromUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signinWithEmailPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
      user = result.user;
      return _userModelFromUser(user);
    } catch (e) {
      print(e);
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
