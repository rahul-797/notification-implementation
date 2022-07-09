import 'package:api/models/database_model.dart';
import 'package:api/services/auth_service.dart';
import 'package:api/services/database_service.dart';
import 'package:api/views/signin_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _auth = AuthService();
  late DatabaseModel data;
  String _name = "";
  String _game = "";
  double mission = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        titleTextStyle: const TextStyle(
          letterSpacing: 2,
          fontSize: 24,
          decorationStyle: TextDecorationStyle.wavy,
          decorationThickness: 2,
          decoration: TextDecoration.lineThrough,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        elevation: 10,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Get.offAll(() => const SigninView());
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: DatabaseService().usersSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error = ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            data = DatabaseModel.fromJson(
                snapshot.data!.docs[0].data() as Map<String, dynamic>);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Now playing:     ",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black87),
                      children: [
                        TextSpan(
                          text: data.game,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.defaultDialog(
                                  title: "Enter new game",
                                  backgroundColor: Colors.white,
                                  barrierDismissible: false,
                                  titleStyle: TextStyle(color: Colors.black87),
                                  radius: 20,
                                  actions: [
                                    TextField(
                                      decoration: InputDecoration(

                                      ),
                                    )
                                  ],
                                  textConfirm: "Save",
                                  confirmTextColor: Colors.white,
                                  textCancel: "Cancel",
                                  titlePadding: EdgeInsets.all(16),
                                ),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    "On mission:    ${data.mission.toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
