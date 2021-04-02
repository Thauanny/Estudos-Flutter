import 'package:async_app/src/models/TodoModel.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio client]) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
