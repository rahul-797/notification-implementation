import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:api/models/todo_model.dart';
import 'package:api/utils/api_constants.dart';

class ApiService {
  Future<List<TodoModel>?> fetchTodo() async {
    try {
      final response = await http
          .get(Uri.parse(ApiConstants.totalUrl));
      if (response.statusCode == 200) {
        List<TodoModel> _model = todoModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
