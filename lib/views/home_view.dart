import 'package:api/services/auth_service.dart';
import 'package:api/services/database_service.dart';
import 'package:api/views/signin_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
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
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Get.offAll(() => SigninView());
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: DatabaseService().usersSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error = ${snapshot.error}'));
          }
          if (snapshot.hasData) {

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "name",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 56),
                  Text(
                    "Now playing: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "On mission: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
