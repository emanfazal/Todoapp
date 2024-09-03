import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppComponents/TaskDialog.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:provider/provider.dart';

import '../../AppComponents/CustomAppbar.dart';
import '../../Providers/TodoProvider.dart';
import '../../model/taskmodel.dart';
import 'Components/TaskBody.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch todos when the screen builds
    Provider.of<TodoProvider>(context, listen: false).fetchTodos();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: TaskBody(),
      floatingActionButton: FloatingActionButton(

        focusColor: AppColors.Gradient1,
        backgroundColor: AppColors.Gradient2,
        onPressed: () => TaskDialogHelper.showAddTaskDialog(context),
        child: Icon(Icons.add,color: AppColors.ButtonTextcolor,),
      ),
    );
  }
}
