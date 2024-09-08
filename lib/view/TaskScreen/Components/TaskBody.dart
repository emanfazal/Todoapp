import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AppComponents/TaskDialog.dart';
import '../../../Constants/utils.dart';
import '../../../Providers/TodoProvider.dart';
import '../../../Services/NotificationServices/NotificationServices.dart';
import '../../../model/taskmodel.dart';
 // Import the helper class

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        if (todoProvider.todos.isEmpty) {
          return Center(child: Text('No tasks found.'));
        } else {
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];

              // Schedule notification if the task has a due date
              if (todo.dueDateTime != null) {
                NotificationHelper.scheduledNotification(
                  todo.task, // Title of the Notification
                  'Task is due soon!', // Content/Body of the Notification
                  todo.dueDateTime!.toDate(), // Scheduled Time for the Notification
                  todo.id, // Pass task ID
                );
              }


              return Card(
                surfaceTintColor: AppColors.primaryColor,
                shadowColor: AppColors.Gradient1,
                child: ListTile(
                  title: Text(todo.task),
                  subtitle: Text(
                    'Completed: ${todo.isDone ? "Yes" : "No"}\n' +
                        (todo.dueDateTime != null
                            ? 'Due: ${todo.dueDateTime!.toDate().toLocal()}'
                            : 'No Due Date'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => TaskDialogHelper.showEditTaskDialog(context, todo),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => TaskDialogHelper.deleteTask(context, todo.id),
                      ),
                    ],
                  ),
                  onTap: () => TaskDialogHelper.toggleTaskCompletion(context, todo),
                ),
              );
            },
          );
        }
      },
    );
  }
}
