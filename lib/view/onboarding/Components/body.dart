import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppComponents/GradientButton.dart';
import 'package:flutter_application_1/Constants/sizer_utils.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:flutter_application_1/generated/assets.dart';
import 'package:flutter_application_1/view/Auth/Login/login.dart';
import 'package:flutter_application_1/view/Welcome/WelcomeScreen.dart';
import 'package:sizer/sizer.dart';

class BoardingBody extends StatelessWidget {
  const BoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Center(
            child: Image.asset(
              Assets.imagesTodolist1,
              height: 200,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(AppPaddings.padding_20),
          child: PrimaryButton(
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen.routeName);
              },
              width: 300,
              height: 50,
              child: Text(
                AppText.Welcome,
                style: TextStyles.h2height20,
              )),
        )
      ],
    );
  }
}
