import 'package:async_app/src/models/TodoModel.dart';
import 'package:async_app/src/repositories/Todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  Future start() async {
    todos = await repository.fetchTodos();
  }
}
