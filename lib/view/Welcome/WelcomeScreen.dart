import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Welcome/Components/Welcomebody.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBody(),
    );
  }
}
