import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trilink_assignment/todo/provider/todo_provider.dart';
import 'package:trilink_assignment/todo/widgets/todo_tile.dart';

class ToDoScreen extends ConsumerStatefulWidget {
  const ToDoScreen({super.key});

  @override
  ConsumerState<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends ConsumerState<ToDoScreen> {
  final controller = TextEditingController();

  void _showEditDialog(BuildContext context, int index, String currentTitle) {
    final editController = TextEditingController(text: currentTitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),

          content: TextField(controller: editController),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                if (editController.text.trim().isEmpty) {
                  return;
                }

                ref
                    .read(todoProvider.notifier)
                    .updateTodo(index, editController.text);

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Enter a new to-do'),
            ),

            SizedBox(height: 16),

            //Add button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) {
                    return;
                  }
                  ref.read(todoProvider.notifier).addTodo(controller.text);
                  controller.clear();
                },
                child: const Text('Add To-Do'),
              ),
            ),

            // List of to-dos
            Expanded(
              child: todos.isEmpty
                  ? const Center(child: Text('No to-dos yet!'))
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];

                        return TodoTile(
                          todo: todo,
                          onToggle: () {
                            ref.read(todoProvider.notifier).toggleTodo(index);
                          },
                          onEdit: () {
                            _showEditDialog(context, index, todo.title);
                          },
                          onDelete: () {
                            ref.read(todoProvider.notifier).deleteTodo(index);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
