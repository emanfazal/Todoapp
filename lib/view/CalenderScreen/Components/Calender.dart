import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import '../../../AppComponents/TaskDialog.dart';
import '../../../Constants/utils.dart';
import '../../../Providers/TodoProvider.dart';
import '../../../model/taskmodel.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  double _calendarHeight = 300.0; // Default height
  DateTime? _selectedDate;
  List<Todo> _filteredTasks = [];

  @override
  Widget build(BuildContext context) {
    // Check if the theme is dark
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Colors for light and dark themes
    final backgroundColor = isDarkTheme ? Colors.black : Colors.white;
    final todayHighlightColor = isDarkTheme ? Colors.orange : AppColors.primaryColor;
    final trailingDatesBackgroundColor = isDarkTheme ? Colors.grey[800] : Colors.grey[300];
    final leadingDatesBackgroundColor = isDarkTheme ? Colors.grey[800] : Colors.grey[300];
    final todayBackgroundColor = isDarkTheme ? Colors.blueGrey : AppColors.Gradient1;

    return Column(
      children: [
        // Calendar widget
        SfCalendar(
          view: CalendarView.month,
          todayHighlightColor: todayHighlightColor,
          backgroundColor: backgroundColor,
          monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            dayFormat: 'EEE',
            numberOfWeeksInView: 6,
            monthCellStyle: MonthCellStyle(
              backgroundColor: backgroundColor,
              todayBackgroundColor: todayBackgroundColor,
              trailingDatesBackgroundColor: trailingDatesBackgroundColor,
              leadingDatesBackgroundColor: leadingDatesBackgroundColor,
            ),
          ),
          onTap: (CalendarTapDetails details) {
            if (details.date != null) {
              final selectedDate = details.date!;
              setState(() {
                _selectedDate = selectedDate;
                _calendarHeight = 350.0; // Increase the height on tap
              });
              _filterTasksForSelectedDate(context, selectedDate);
            }
          },
        ),
        // Task list display area
        Expanded(
          child: _filteredTasks.isNotEmpty
              ? ListView.builder(
            itemCount: _filteredTasks.length,
            itemBuilder: (context, index) {
              final task = _filteredTasks[index];
              return Card(
                surfaceTintColor: AppColors.primaryColor,
                shadowColor: AppColors.Gradient1,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text(
                    task.task,
                    style: TextStyles.Taskheadingheight18(context),
                  ),
                  subtitle: Text(
                    task.isDone ? 'Completed' : 'Pending',
                    style: TextStyles.Tasktextheight15(context),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: AppColors.secondaryColor),
                    onPressed: () {
                      // Show the edit task dialog
                      TaskDialogHelper.showEditTaskDialog(context, task);
                    },
                  ),
                ),
              );
            },
          )
              : Center(
            child: Text(
              _selectedDate != null
                  ? 'No tasks for ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                  : AppText.SelectDate,
              style: TextStyles.appbartextheight20(context),
            ),
          ),
        ),
      ],
    );
  }

  void _filterTasksForSelectedDate(BuildContext context, DateTime selectedDate) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    setState(() {
      _filteredTasks = todoProvider.todos.where((todo) {
        if (todo.dueDateTime != null) {
          final dueDate = todo.dueDateTime!.toDate().toLocal();
          return dueDate.year == selectedDate.year &&
              dueDate.month == selectedDate.month &&
              dueDate.day == selectedDate.day;
        }
        return false;
      }).toList();
    });
  }
}
