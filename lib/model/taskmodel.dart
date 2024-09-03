import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String task;
  bool isDone;
  Timestamp CreatedOn;
  Timestamp UpdatedOn;
  Timestamp? dueDateTime; // This will store both date and time

  Todo({
    required this.id,
    required this.task,
    required this.isDone,
    required this.CreatedOn,
    required this.UpdatedOn,
    this.dueDateTime,
  });

  Todo.fromJson(Map<String, dynamic> json, String id)
      : this(
    id: id,
    task: json["task"] as String,
    isDone: json["isDone"] as bool,
    CreatedOn: json["CreatedOn"] as Timestamp,
    UpdatedOn: json["UpdatedOn"] as Timestamp,
    dueDateTime: json["dueDateTime"] as Timestamp?,
  );

  Todo copyWith({
    String? id,
    String? task,
    bool? isDone,
    Timestamp? CreatedOn,
    Timestamp? UpdatedOn,
    Timestamp? dueDateTime,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      CreatedOn: CreatedOn ?? this.CreatedOn,
      UpdatedOn: UpdatedOn ?? this.UpdatedOn,
      dueDateTime: dueDateTime ?? this.dueDateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "task": task,
      "isDone": isDone,
      "CreatedOn": CreatedOn,
      "UpdatedOn": UpdatedOn,
      "dueDateTime": dueDateTime,
    };
  }
}
