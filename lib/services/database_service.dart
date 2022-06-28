import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _auth =  FirebaseAuth.instance;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData(String name, String game, int mission) async {
    await usersCollection.doc(_auth.currentUser!.uid).set({
      "name": name,
      "game": game,
      "mission": mission,
    });
  }

  Stream<QuerySnapshot> get usersSnapshot => usersCollection.snapshots();
}
