import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/todo_model.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  void addTodo(String title) {
    state = [...state, Todo(title: title)];
  }

  void deleteTodo(int index) {
    final updated = [...state];

    updated.removeAt(index);

    state = updated;
  }

  void toggleTodo(int index) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(
      isCompleted: !updated[index].isCompleted,
    );

    state = updated;
  }

  void updateTodo(int index, String newTitle) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(title: newTitle);

    state = updated;
  }

  @override
  List<Todo> build() {
    return [];
  }
}

final todoProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new,
);
