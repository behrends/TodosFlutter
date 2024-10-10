import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;

  const TodoItem({super.key, required this.title});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {/* to be implemented */},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {/* to be implemented */},
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
