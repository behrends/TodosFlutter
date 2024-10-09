import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;

  const TodoItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}