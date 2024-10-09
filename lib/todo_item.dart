import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;

  const TodoItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}