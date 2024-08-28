import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/taskmodel.dart';
import '../Services/FirestoreServices/databaseServices.dart';

class TodoProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoProvider() {
    fetchTodos();
  }

  void fetchTodos() {
    _databaseService.getTodo().listen((snapshot) {
      _todos = snapshot.docs.map((doc) {
        // Get the document ID
        final id = doc.id;

        // Create a Todo object with the document ID
        return Todo.fromJson(doc.data() as Map<String, dynamic>, id);
      }).toList();
      notifyListeners();
    });
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _databaseService.addTodo(todo);
    } catch (e) {
      print("Error adding Todo: $e");
    }
  }
}
