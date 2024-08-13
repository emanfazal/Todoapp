import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/assets.dart';

import '../../../AppComponents/GradientButton.dart';
import '../../../Constants/utils.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(Assets.imagesLoginpageimage,),
          ),
          Text(AppText.WelcomeText,style: TextStyles.h2height50,),
          SizedBox(
            height: 20,
          ),
          Text(AppText.StartyourDay,style: TextStyles.h2height45,),
          SizedBox(
            height: 20,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: PrimaryButton(onPressed: () {  }, width: 300, height: 50, child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(Assets.imagesGoogleicon),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(AppText.ContinuewithGoogle,style: TextStyles.h2height20,),
                )
              ],
            ),),
          ),
        ],
      ),
    );
  }
}
