import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppComponents/CustomAppbar.dart';
import '../../Providers/TodoProvider.dart';
import '../../model/taskmodel.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch todos when the screen is built
    Provider.of<TodoProvider>(context, listen: false).fetchTodos();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          if (todoProvider.todos.isEmpty) {
            return Center(child: Text('No tasks found.'));
          } else {
            return ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return ListTile(
                  title: Text(todo.task),
                  subtitle: Text(
                    'Completed: ${todo.isDone ? "Yes" : "No"}\n' +
                        (todo.dueDateTime != null ? 'Due: ${todo.dueDateTime!.toDate().toLocal()}' : 'No Due Date'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showEditTaskDialog(context, todo),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(context, todo.id),
                      ),
                    ],
                  ),
                  onTap: () => _toggleTaskCompletion(context, todo),
                );
              },
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
    DateTime? selectedDueDate;
    TimeOfDay? selectedDueTime;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
                    : 'Due Date: ${selectedDueDate?.toLocal()}'),
                onPressed: () async {
                  final selectedDate = await _selectDueDate(context);
                  if (selectedDate != null) {
                    selectedDueDate = selectedDate;
                  }
                },
              ),
              ElevatedButton(
                child: Text(selectedDueTime == null
                    ? 'Select Due Time'
                    : 'Due Time: ${selectedDueTime!.format(context)}'),
                onPressed: () async {
                  final selectedTime = await _selectDueTime(context);
                  if (selectedTime != null) {
                    selectedDueTime = selectedTime;
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
                    id: DateTime.now().toString(), // Temporary ID
                    task: task,
                    isDone: false,
                    CreatedOn: Timestamp.now(),
                    UpdatedOn: Timestamp.now(),
                    dueDateTime: Timestamp.fromDate(dueDateTime),
                  );
                  Provider.of<TodoProvider>(context, listen: false)
                      .addTodo(newTodo);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, Todo todo) {
    final TextEditingController taskController = TextEditingController(text: todo.task);
    DateTime? selectedDueDate = todo.dueDateTime?.toDate();
    TimeOfDay? selectedDueTime = selectedDueDate != null ? TimeOfDay.fromDateTime(selectedDueDate) : null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
                    : 'Due Date: ${selectedDueDate?.toLocal()}'),
                onPressed: () async {
                  final pickedDate = await _selectDueDate(context);
                  if (pickedDate != null) {
                    selectedDueDate = pickedDate;
                  }
                },
              ),
              ElevatedButton(
                child: Text(selectedDueTime == null
                    ? 'Select Due Time'
                    : 'Due Time: ${selectedDueTime!.format(context)}'),
                onPressed: () async {
                  final pickedTime = await _selectDueTime(context);
                  if (pickedTime != null) {
                    selectedDueTime = pickedTime;
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
                  Provider.of<TodoProvider>(context, listen: false)
                      .updateTodo(updatedTodo);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<DateTime?> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }

  Future<TimeOfDay?> _selectDueTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return pickedTime;
  }

  void _deleteTask(BuildContext context, String id) {
    Provider.of<TodoProvider>(context, listen: false).deleteTodo(id);
  }

  void _toggleTaskCompletion(BuildContext context, Todo todo) {
    final updatedTodo = todo.copyWith(
      isDone: !todo.isDone,
      UpdatedOn: Timestamp.now(),
    );
    Provider.of<TodoProvider>(context, listen: false).updateTodo(updatedTodo);
  }
}
