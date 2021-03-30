import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Todo> fetch() async {
  var url = 'http://swapi.dev/api/people/1/';
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  return todo;
}

Future main() async {
  final todo = await fetch();
  print(todo.title);

  print(stringToInt('200'));
}

class Todo {
  final String title;
  final String id;
  final String completed;

  Todo({this.title, this.id, this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(
        title: json['name'], completed: json['homeworld'], id: json['gender']);
  }

  Map toJson() {
    return {'title': title, 'id': id, 'completed': completed};
  }
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (error) {
    value = 0;
  }

  return value;
}
