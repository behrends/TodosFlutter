import 'package:flutter/material.dart';

class Todo {
  final String title;
  bool done;

  Todo({required this.title, this.done = false});

  // Todo in Map umwandeln (serialisieren)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'done': done,
    };
  }

  // Map in Todo umwandeln (deserialisieren)
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      done: map['done'] ?? false,
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.todo.done = !widget.todo.done;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            Checkbox(
              value: widget.todo.done,
              onChanged: (bool? value) {
                setState(() {
                  widget.todo.done = value ?? false;
                });
              },
            ),
            Text(
              widget.todo.title,
              style: TextStyle(
                fontSize: 18,
                decoration: widget.todo.done ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
