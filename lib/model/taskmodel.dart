import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String task;
  bool isDone;
  Timestamp CreatedOn;
  Timestamp UpdatedOn;

  Todo({
    required this.id, // Add id to the constructor
    required this.task,
    required this.isDone,
    required this.CreatedOn,
    required this.UpdatedOn,
  });

  // Modify fromJson to handle id
  Todo.fromJson(Map<String, dynamic> json, String id)
      : this(
    id: id,
    task: json["task"] as String,
    isDone: json["isDone"] as bool,
    CreatedOn: json["CreatedOn"] as Timestamp,
    UpdatedOn: json["UpdatedOn"] as Timestamp,
  );

  Todo copyWith({
    String? id,
    String? task,
    bool? isDone,
    Timestamp? CreatedOn,
    Timestamp? UpdatedOn,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      CreatedOn: CreatedOn ?? this.CreatedOn,
      UpdatedOn: UpdatedOn ?? this.UpdatedOn,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "task": task,
      "isDone": isDone,
      "CreatedOn": CreatedOn,
      "UpdatedOn": UpdatedOn,
    };
  }
}
