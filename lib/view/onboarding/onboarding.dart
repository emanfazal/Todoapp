import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/onboarding/Components/body.dart';
import 'package:sizer/sizer.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  static String routeName = "/boarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BoardingBody(),
    );
  }
}
