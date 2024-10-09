import 'package:flutter/material.dart';
import 'package:myapp/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo-App'),
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('Todo hinzufügen'),
        tooltip: 'Todo hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
