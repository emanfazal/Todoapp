import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/taskmodel.dart';

class TodoProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Todo> _todos = [];
  List<Todo> _filteredTodos = [];

  List<Todo> get todos => _filteredTodos.isNotEmpty ? _filteredTodos : _todos;

  Future<void> fetchTodos() async {
    final snapshot = await _firestore.collection('todos').get();
    _todos = snapshot.docs
        .map((doc) => Todo.fromJson(doc.data(), doc.id))
        .toList();
    // Sort todos by dueDateTime
    _todos.sort((a, b) {
      if (a.dueDateTime == null && b.dueDateTime == null) {
        return 0;
      } else if (a.dueDateTime == null) {
        return 1;
      } else if (b.dueDateTime == null) {
        return -1;
      } else {
        return a.dueDateTime!.compareTo(b.dueDateTime!);
      }
    });
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    await _firestore.collection('todos').add(todo.toJson());
    fetchTodos();
  }

  Future<void> updateTodo(Todo todo) async {
    await _firestore.collection('todos').doc(todo.id).update(todo.toJson());
    fetchTodos();
  }

  Future<void> deleteTodo(String id) async {
    await _firestore.collection('todos').doc(id).delete();
    fetchTodos();
  }

  // Search functionality
  void searchTodos(String query) {
    if (query.isEmpty) {
      _filteredTodos = [];
    } else {
      _filteredTodos = _todos
          .where((todo) => todo != null &&
          todo.task.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

}
