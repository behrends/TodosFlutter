import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;

  const TodoItem({super.key, required this.title});

  // TodoItem in Map umwandeln (serialisieren)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  // Map in TodoItem umwandeln (deserialisieren)
  // Factory-Konstruktor, der ein TodoItem aus einer Map erstellt
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      title: map['title'],
    );
  }

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool _done = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _done = !_done;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            Checkbox(
              value: _done,
              onChanged: (bool? value) {
                setState(() {
                  _done = value ?? false;
                });
              },
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                decoration: _done ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
