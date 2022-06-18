import 'package:flutter/material.dart';

import 'package:api/services/api_service.dart';
import 'package:api/models/todo_model.dart';

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
        elevation: 10,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.notifications),
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
                                  text: TodoModel().title,
                                  style: TextStyle(
                                    fontSize: 24,
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
