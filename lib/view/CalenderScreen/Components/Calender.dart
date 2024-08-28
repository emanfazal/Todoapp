import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
        view: CalendarView.month,  // Set the view to month
        todayHighlightColor: AppColors.primaryColor,  // Customize today highlight color
        backgroundColor: Colors.white,  // Set calendar background color
        monthViewSettings: MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        dayFormat: 'EEE',
        numberOfWeeksInView: 6,
        monthCellStyle: MonthCellStyle(
        backgroundColor: AppColors.BackgroundColor,
        todayBackgroundColor: AppColors.Gradient1,
    trailingDatesBackgroundColor: Colors.grey[300],
    leadingDatesBackgroundColor:Colors.grey[300]),
    ));
  }
}
