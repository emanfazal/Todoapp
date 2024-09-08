import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Providers/TodoProvider.dart';
import '../../../model/taskmodel.dart';
import '../Constants/utils.dart';
import '../Services/NotificationServices/NotificationServices.dart';

class TaskDialogHelper {
  // Method to show Add Task Dialog
  static void showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    DateTime? selectedDueDate;
    TimeOfDay? selectedDueTime;

    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // Apply your primary color
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: AlertDialog(
            title: Text('Add New Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(labelText: 'Task'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(selectedDueDate == null
                      ? 'Select Due Date'
                      : 'Due Date: ${selectedDueDate?.toLocal()}'.split(' ')[0]),
                  onPressed: () async {
                    final selectedDate = await _selectDueDate(context);
                    if (selectedDate != null) {
                      selectedDueDate = selectedDate;
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(selectedDueTime == null
                      ? 'Select Due Time'
                      : 'Due Time: ${selectedDueTime!.format(context)}'),
                  onPressed: () async {
                    final selectedTime = await _selectDueTime(context);
                    if (selectedTime != null) {
                      selectedDueTime = selectedTime;
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Add'),
                onPressed: () {
                  final task = taskController.text;
                  if (task.isNotEmpty && selectedDueDate != null && selectedDueTime != null) {
                    final dueDateTime = DateTime(
                      selectedDueDate!.year,
                      selectedDueDate!.month,
                      selectedDueDate!.day,
                      selectedDueTime!.hour,
                      selectedDueTime!.minute,
                    );
                    final newTodo = Todo(
                      id: DateTime.now().millisecondsSinceEpoch.toString(), // Use a unique ID
                      task: task,
                      isDone: false,
                      CreatedOn: Timestamp.now(),
                      UpdatedOn: Timestamp.now(),
                      dueDateTime: Timestamp.fromDate(dueDateTime),
                    );
                    Provider.of<TodoProvider>(context, listen: false).addTodo(newTodo);

                    // Schedule notification

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void showEditTaskDialog(BuildContext context, Todo todo) {
    final TextEditingController taskController = TextEditingController(text: todo.task);
    DateTime? selectedDueDate = todo.dueDateTime?.toDate();
    TimeOfDay? selectedDueTime = selectedDueDate != null ? TimeOfDay.fromDateTime(selectedDueDate) : null;

    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: AlertDialog(
            title: Text('Edit Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(labelText: 'Task'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(selectedDueDate == null
                      ? 'Select Due Date'
                      : 'Due Date: ${selectedDueDate?.toLocal()}'.split(' ')[0]),
                  onPressed: () async {
                    final pickedDate = await _selectDueDate(context);
                    if (pickedDate != null) {
                      selectedDueDate = pickedDate;
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(selectedDueTime == null
                      ? 'Select Due Time'
                      : 'Due Time: ${selectedDueTime!.format(context)}'),
                  onPressed: () async {
                    final pickedTime = await _selectDueTime(context);
                    if (pickedTime != null) {
                      selectedDueTime = pickedTime;
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Update'),
                onPressed: () {
                  final updatedTask = taskController.text;
                  if (updatedTask.isNotEmpty && selectedDueDate != null && selectedDueTime != null) {
                    final dueDateTime = DateTime(
                      selectedDueDate!.year,
                      selectedDueDate!.month,
                      selectedDueDate!.day,
                      selectedDueTime!.hour,
                      selectedDueTime!.minute,
                    );
                    final updatedTodo = todo.copyWith(
                      task: updatedTask,
                      UpdatedOn: Timestamp.now(),
                      dueDateTime: Timestamp.fromDate(dueDateTime),
                    );
                    Provider.of<TodoProvider>(context, listen: false).updateTodo(updatedTodo);

                    // Schedule notification


                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<DateTime?> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // Apply your primary color
              onPrimary: Colors.white, // Text color on primary
              onSurface: Colors.black, // Text color on surface
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    return pickedDate;
  }

  static Future<TimeOfDay?> _selectDueTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // Apply your primary color
              onPrimary: Colors.white, // Text color on primary
              onSurface: Colors.black, // Text color on surface
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    return pickedTime;
  }

  // Method to delete a task
  static void deleteTask(BuildContext context, String id) {
    Provider.of<TodoProvider>(context, listen: false).deleteTodo(id);
  }

  // Method to toggle task completion
  static void toggleTaskCompletion(BuildContext context, Todo todo) {
    final updatedTodo = todo.copyWith(
      isDone: !todo.isDone,
      UpdatedOn: Timestamp.now(),
    );
    Provider.of<TodoProvider>(context, listen: false).updateTodo(updatedTodo);
  }
}
