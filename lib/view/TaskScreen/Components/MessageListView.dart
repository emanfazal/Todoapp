import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Providers/todoProvider.dart';
import 'package:flutter_application_1/model/taskmodel.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        if (todoProvider.todos.isEmpty) {
          return Center(child: Text('No messages found.'));
        } else {
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];
              return ListTile(
                title: Text(todo.task),
                subtitle: Text('Completed: ${todo.isDone ? "Yes" : "No"}'),
                trailing: Text('ID: ${todo.id}'),
              );
            },
          );
        }
      },
    );
  }
}
