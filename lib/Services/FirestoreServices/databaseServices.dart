import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/taskmodel.dart';

const String TODO_COLLECTION_REF = "Todos";

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Todo> _todosRef;

  DatabaseService() {
    _todosRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Todo>(
      fromFirestore: (snapshots, _) {
        final data = snapshots.data();
        if (data != null) {
          // Pass both the data and the document ID
          return Todo.fromJson(data as Map<String, dynamic>, snapshots.id);
        } else {
          throw Exception('Data is null');
        }
      },
      toFirestore: (todo, _) => todo.toJson(),
    );
  }

  Stream<QuerySnapshot<Todo>> getTodo() {
    return _todosRef.snapshots();
  }

  Future<void> addTodo(Todo todo) async {
    await _todosRef.add(todo);
  }
}
