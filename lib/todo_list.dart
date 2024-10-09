import 'package:flutter/material.dart';
import 'package:myapp/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TodoItem(title: 'Einkaufen'),
        TodoItem(title: 'Kochen'),
        TodoItem(title: 'Sport'),
      ],
    );
  }
}
