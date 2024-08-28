import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:flutter_application_1/view/HomePage/HomePage.dart';
import 'package:flutter_application_1/view/SplashScreen/Components/SplashBody.dart';
import 'package:flutter_application_1/view/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!splashScreenProvider.isloading) {
        if (userProvider.user == null) {
          Navigator.pushReplacementNamed(context, Onboarding.routeName);
        } else {
          Navigator.pushReplacementNamed(context, HomePage.routeName); // Replace '/home' with your actual home screen route name
        }
      }
    });

    return Scaffold(
      body: SplashBody(),
    );
  }
}
