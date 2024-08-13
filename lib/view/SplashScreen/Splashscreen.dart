import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/view/SplashScreen/Components/SplashBody.dart';
import 'package:flutter_application_1/view/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!splashScreenProvider.isloading) {
        Navigator.pushReplacementNamed(context, Onboarding.routeName);
      }
    });

    return Scaffold(
      // backgroundColor: Colors.black,
      body: SplashBody(),
    );
  }
}
