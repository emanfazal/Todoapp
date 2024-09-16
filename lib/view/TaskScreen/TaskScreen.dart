import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AppComponents/TaskDialog.dart';
import '../../../Constants/utils.dart';
import '../../../Providers/TodoProvider.dart';
import '../../../Services/NotificationServices/NotificationServices.dart';

import 'Components/TaskBody.dart';
import '../../AppComponents/CustomAppbar.dart'; // Make sure the path is correct

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch todos when the screen builds
    Provider.of<TodoProvider>(context, listen: false).fetchTodos();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(), // Use the updated CustomAppBar
      ),
      body: TaskBody(),
      floatingActionButton: FloatingActionButton(
        focusColor: AppColors.Gradient1,
        backgroundColor: AppColors.Gradient2,
        onPressed: () => TaskDialogHelper.showAddTaskDialog(context),
        child: Icon(Icons.add, color: AppColors.ButtonTextcolor),
      ),
    );
  }
}
