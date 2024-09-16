import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';

import '../../../AppComponents/TaskDialog.dart';
import '../../../Constants/utils.dart';
import '../../../Providers/TodoProvider.dart';
import 'Calender.dart';

class CalenderScreenBody extends StatelessWidget {
  const CalenderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          Expanded(

            child: Calender(),
          ),


        ],

    );
  }



}
