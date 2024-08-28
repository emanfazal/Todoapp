import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/CalenderScreen/Components/Calender.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Calender(),
        ],
      ),
    );
  }
}
