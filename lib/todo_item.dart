import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;

  const TodoItem({super.key, required this.title});

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
                  _done = !_done;
                });
              },
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
