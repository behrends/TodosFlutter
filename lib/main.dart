import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');

    if (todosString != null) {
      final List decoded = jsonDecode(todosString);
      setState(() {
        _todos.clear();
        _todos.addAll(decoded.map((item) => TodoItem(todo: Todo.fromMap(item))).toList());
      });
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String todosString =
        jsonEncode(_todos.map((item) => item.todo.toMap()).toList());
    await prefs.setString('todos', todosString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo-App'),
      ),
      body: TodoList(todos: _todos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController controller = TextEditingController();
              return AlertDialog(
                title: const Text('Neues Todo'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Todo eingeben'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Abbrechen'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        Navigator.of(context).pop(controller.text.trim());
                      }
                    },
                    child: const Text('Hinzufügen'),
                  ),
                ],
              );
            },
          ).then((value) {
            if (value != null && value is String) {
              setState(() {
                _todos.add(TodoItem(todo: Todo(title: value)));
              });
              _saveTodos();
            }
          });
        },
        tooltip: 'Todo hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
