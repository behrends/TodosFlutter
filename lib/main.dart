import 'package:flutter/material.dart';
import 'package:myapp/todo_item.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TodoItem> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo-App'),
      ),
      body: TodoList(todos: _todos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _todos.add(const TodoItem(title: 'Neues Todo'));
          });
        },
        tooltip: 'Todo hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
