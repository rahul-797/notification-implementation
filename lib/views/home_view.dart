import 'package:api/views/signin_view.dart';
import 'package:flutter/material.dart';

import 'package:api/services/api_service.dart';
import 'package:api/services/auth_service.dart';
import 'package:api/models/todo_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<TodoModel>? _todoList = [];
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _todoList = await (ApiService().fetchTodo());
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        titleTextStyle: const TextStyle(
          letterSpacing: 2,
          fontSize: 24,
          decorationStyle: TextDecorationStyle.wavy,
          decorationThickness: 3,
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
              await _authService.signOut();
              Get.offAll(() => SigninView());
            },
          ),
        ],
      ),
      body: _todoList == null || _todoList!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _todoList!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: RichText(
                            text: TextSpan(
                              text: "Task name: \n",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: _todoList![index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            _todoList![index].completed == true
                                ? "Done!"
                                : "Not done yet",
                            style: TextStyle(
                              fontSize: 20,
                              color: _todoList![index].completed == true
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
