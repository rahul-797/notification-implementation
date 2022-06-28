import 'package:flutter/material.dart';

import 'package:api/services/api_service.dart';
import 'package:api/models/todo_model.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  late List<TodoModel>? _todoList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _todoList = await (ApiService().fetchTodo());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
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
      ),
      body: _todoList == null || _todoList!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _todoList!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: RichText(
                            text: TextSpan(
                              text: "Task name: \n",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: _todoList![index].title,
                                  style: const TextStyle(
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
