import 'package:flutter/material.dart';

import 'package:api/services/api_service.dart';

import '../models/todo_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<TodoModel>? _todoList = [];

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
        title: Text("Task Details"),
      ),
      body: _todoList == null || _todoList!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _todoList!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black54,
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Task name: \n${_todoList![index].title}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _todoList![index].completed == true
                              ? "Done!"
                              : "Not done yet",
                          style: TextStyle(
                            fontSize: 20,
                            color: _todoList![index].completed == true
                                ? Colors.lightGreenAccent
                                : Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
