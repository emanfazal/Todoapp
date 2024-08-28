import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppComponents/CustomAppbar.dart';
import 'package:flutter_application_1/view/TaskScreen/Components/MessageListView.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  CustomAppBar(),
  MessageListView(),

],
    );
  }
}
