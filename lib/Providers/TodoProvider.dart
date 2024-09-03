import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/taskmodel.dart';

class TodoProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

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
        return 1; // Tasks with no dueDateTime come last
      } else if (b.dueDateTime == null) {
        return -1; // Tasks with no dueDateTime come last
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
}
