import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/sizer_utils.dart';

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
}

class TextStyles {
  static const h2height20 = TextStyle(
    fontSize: 20,
    height: 1,
    fontFamily: 'NunitoSans',
    color: AppColors.ButtonTextcolor,
    // fontFamily:
  );
  static const h2height50 = TextStyle(
    fontSize: 35,
    height: 1,
    fontFamily: 'NunitoSans',
    color: AppColors.primaryColor,
    // fontFamily:
  );
  static const h2height45 = TextStyle(
    fontSize: 30,
    height: 1,
    fontFamily: 'NunitoSans',
    color: AppColors.Gradient2,
    // fontFamily:
  );
}
