import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/CalenderScreen/Components/CalenderScreenbody.dart';

import '../../Constants/utils.dart';
import 'Components/Calender.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Stack(
            alignment: Alignment.center, // Center the text
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Calender",
                  style: TextStyles.appbartextheight20(context),
                ),
              ),
            ],
          ),
        ),

        body: CalenderScreenBody());
  }
}
