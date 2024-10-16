import 'package:flutter/material.dart';
import 'package:myapp/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return todos[index];
      },
    );
  }
}
