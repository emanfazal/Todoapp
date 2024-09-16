import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/generated/assets.dart';
import 'package:flutter_application_1/view/HomePage/HomePage.dart';
import '../../../AppComponents/GradientButton.dart';
import '../../../Constants/utils.dart';
import '../../../controllers/usercontroller.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(
              Assets.imagesTodolist1,
              height: 200,
            ),
          ),
          // Text(
          //   AppText.WelcomeText,
          //   style: TextStyles.h2height50,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Center(
          //   child: Text(
          //     AppText.StartyourDay,
          //     style: TextStyles.h2height45,
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) => PrimaryButton(
                onPressed: () async {
                  await authProvider.signInWithGoogle(context);
                  // Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                width: 300,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        Assets.imagesGoogleGradienticon2,
                        height: 50,
                        width: 40,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        AppText.ContinuewithGoogle,
                        style: TextStyles.h2height20(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
