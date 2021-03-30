import 'package:async_app/src/repositories/Todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = TodoRepository();
  test('Trazer lista de TodoModel', () async {
    final list = await repository.fetchTodos();
    expect(list[0].completed, false);
  });
}
