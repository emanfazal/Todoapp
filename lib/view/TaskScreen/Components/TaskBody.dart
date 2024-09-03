import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AppComponents/CustomAppbar.dart';
import '../../../Providers/TodoProvider.dart';
import '../../../model/taskmodel.dart'; // Ensure the Todo model is imported

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar if you have one
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          if (todoProvider.todos.isEmpty) {
            return Center(child: Text('No tasks found.'));
          } else {
            return Column(
              children: [
                CustomAppBar(),
                ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.todos[index];
                    return ListTile(
                      title: Text(todo.task),
                      subtitle: Text('Completed: ${todo.isDone ? "Yes" : "No"}'),
                      trailing: Text('ID: ${todo.id}'),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task description'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final task = taskController.text.trim();
                if (task.isNotEmpty) {
                  final newTodo = Todo(
                    CreatedOn: Timestamp.now(), // Default value
                    UpdatedOn: Timestamp.now(),
                    id: DateTime.now().toString(), // Generate a unique ID
                    task: task,
                    isDone: false,
                    // Default value
                  );

                  Provider.of<TodoProvider>(context, listen: false).addTodo(newTodo);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
