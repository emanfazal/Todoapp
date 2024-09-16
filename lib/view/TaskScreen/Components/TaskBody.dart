import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/TodoProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting

import '../../../AppComponents/TaskDialog.dart';
import '../../../Constants/utils.dart';
import '../../../Services/NotificationServices/NotificationServices.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        final todos = todoProvider.todos;

        if (todos.isEmpty) {
          return Center(
            child: Text(
              'Loading Tasks....',
              style: TextStyles.appbartextheight20(context),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              // Schedule notification if the task has a due date
              if (todo.dueDateTime != null) {
                final dueDateTime = todo.dueDateTime!.toDate(); // Convert Firestore timestamp to DateTime
                final currentTime = DateTime.now(); // Get the current time

                // Allow a small window of 1 second for precision issues
                final timeDifference = dueDateTime.difference(currentTime).abs();
                if (timeDifference <= Duration(seconds: 1)) {
                  NotificationHelper.scheduledNotification(
                    todo.task,
                    'Task is due now!',
                    dueDateTime,
                    todo.id,
                  );
                }
              }

              // Format the due date and due time separately
              String formattedDueDate = '';
              String formattedDueTime = '';
              if (todo.dueDateTime != null) {
                final dueDateTime = todo.dueDateTime!.toDate();

                // Format due date (dd/MM/yy)
                formattedDueDate = DateFormat('dd/MM/yy').format(dueDateTime);

                // Format due time (hh:mm a)
                formattedDueTime = DateFormat('hh:mm a').format(dueDateTime);
              }

              return Card(
                surfaceTintColor: AppColors.primaryColor,
                shadowColor: AppColors.Gradient1,
                child: ListTile(
                  title: Text(
                    todo.task,
                    style: todo.isDone
                        ? TextStyles.strikethroughTaskText(context)// Apply strikethrough style if task is done
                        : TextStyles.Taskheadingheight18(context), // Apply normal task text style if task is not done
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Completed: ',
                          style: TextStyles.Tasktextheight15(context), // Style for the label
                        ),
                        TextSpan(
                          text: todo.isDone ? 'Yes' : 'No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: todo.isDone
                                ? AppColors.Gradient2
                                : AppColors.primaryColor, // Different style for value
                          ),
                        ),
                        if (!todo.isDone && todo.dueDateTime != null) ...[
                          TextSpan(
                            text: '\nDue Date: ',
                            style: TextStyles.Tasktextheight15(context), // Style for the label
                          ),
                          TextSpan(
                            text: formattedDueDate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Different style for date value
                            ),
                          ),
                          TextSpan(
                            text: '\nDue Time: ',
                            style: TextStyles.Tasktextheight15(context), // Style for the label
                          ),
                          TextSpan(
                            text: formattedDueTime,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Different style for time value
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () =>
                            TaskDialogHelper.showEditTaskDialog(context, todo),
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
