import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/sizer_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppColors {
  static const Color primaryColor = Color(0xFFFF426E);
  static const Color secondaryColor = Colors.black;
  static const Color TextColor = Color(0xFF272727);
  static const Color BackgroundColor = Colors.white;
  static const Color Gradient1 = Color(0xFFF79E89);
  static const Color Gradient2 = Color(0xFFF76C6A);
  static const Color ButtonTextcolor = Color(0xFFFFFFFF);
  static const Color ElevatedButtonColor=Colors.white;
  static const Color DarkGrey = Color(0xFF828282);
}

class AppText {
  static const String Welcome = "Get Started";
  static const String WelcomeText = "Welcome";
  static const String StartyourDay="Start your Day & Be Productive";
  static const String ContinuewithGoogle="Continue with google";
  static const String Todolist="To-Do List";
  static const String Calender="Calender";
  static const String SelectDate="Select Date to show Tasks";

}



// Assume AppColors class is updated to use colors based on the theme

class TextStyles {
  static TextStyle h2height19(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.ButtonTextcolor;

    return GoogleFonts.alef(
      fontSize: 19,
      height: 1,
      color: textColor,
    );
  }

  static TextStyle h2height20(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.ButtonTextcolor;

    return GoogleFonts.alef(
      fontSize: 20,
      height: 1,
      color: textColor,
    );
  }

  static TextStyle h2height50(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.primaryColor;

    return GoogleFonts.alef(
      fontSize: 35,
      height: 1,
      color: textColor,
    );
  }

  static TextStyle h2height45(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.Gradient2;

    return GoogleFonts.alef(
      fontSize: 30,
      height: 1,
      color: textColor,
    );
  }

  static TextStyle btextheight20(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.primaryColor;

    return GoogleFonts.alef(
      fontSize: 20,
      height: 1,
      color: textColor,
    );
  }

  static TextStyle appbartextheight20(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.secondaryColor;

    return GoogleFonts.alef(
      fontSize: 20,
      height: 1,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle ElevatedButtontextheight20(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.ElevatedButtonColor;

    return GoogleFonts.alef(
      fontSize: 20,
      height: 1,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle Tasktextheight15(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.secondaryColor;

    return GoogleFonts.alef(
      fontSize: 15,
      height: 1,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle Taskheadingheight18(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.secondaryColor;

    return GoogleFonts.alef(
      fontSize: 18,
      height: 1,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle strikethroughTaskText(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkTheme ? Colors.white : AppColors.secondaryColor;

    return GoogleFonts.alef(
      fontSize: 15,
      height: 1,
      color: textColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }
}

