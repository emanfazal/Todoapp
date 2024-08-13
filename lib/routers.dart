import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Auth/Login/login.dart';
import 'package:flutter_application_1/view/SplashScreen/Splashscreen.dart';
import 'package:flutter_application_1/view/Welcome/WelcomeScreen.dart';
import 'package:flutter_application_1/view/onboarding/onboarding.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  Onboarding.routeName: (context) => Onboarding(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
};
