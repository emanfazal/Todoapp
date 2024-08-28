import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/sizer_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFF426E);
  static const Color secondaryColor = Colors.black;
  static const Color TextColor = Color(0xFF272727);
  static const Color BackgroundColor = Colors.white;
  static const Color Gradient1 = Color(0xFFF79E89);
  static const Color Gradient2 = Color(0xFFF76C6A);
  static const Color ButtonTextcolor = Color(0xFFFFFFFF);
}

class AppText {
  static const String Welcome = "Get Started";
  static const String WelcomeText = "Welcome";
  static const String StartyourDay="Start your Day & Be Productive";
  static const String ContinuewithGoogle="Continue with google";
  static const String Todolist="List of To Do";
}

class TextStyles {
  static final h2height19 = GoogleFonts.alef(
    fontSize: 19,
    height: 1,
    color: AppColors.ButtonTextcolor,
  );

  static final h2height20 = GoogleFonts.alef(
    fontSize: 20,
    height: 1,
    color: AppColors.ButtonTextcolor,
  );

  static final h2height50 = GoogleFonts.alef(

    fontSize: 35,
    height: 1,
    color: AppColors.primaryColor,
  );

  static final h2height45 = GoogleFonts.alef(
    fontSize: 30,
    height: 1,
    color: AppColors.Gradient2,
  );
  static final btextheight20 = GoogleFonts.alef(
    fontSize: 20,
    height: 1,
    color: AppColors.primaryColor,
  );
  static final appbartextheight20 = GoogleFonts.alef(
    fontSize: 20,
    height: 1,
    color:AppColors.secondaryColor,
    fontWeight:FontWeight.bold,
  );
}
