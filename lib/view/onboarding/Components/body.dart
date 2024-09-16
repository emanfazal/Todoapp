import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppComponents/GradientButton.dart';
import 'package:flutter_application_1/Constants/sizer_utils.dart';
import 'package:flutter_application_1/Constants/utils.dart'; // Make sure AppColors is defined here
import 'package:flutter_application_1/generated/assets.dart';
import 'package:flutter_application_1/view/Auth/Login/login.dart';
import 'package:flutter_application_1/view/Welcome/WelcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class BoardingBody extends StatelessWidget {
  const BoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var title = "Welcome! to ToDoApp"; // Assign a value to `title` if needed

    return Expanded(
      child: IntroductionScreen(
        globalBackgroundColor: AppColors.BackgroundColor, // Ensure AppColors is defined
        pages: [
          PageViewModel(
            title: title,
            bodyWidget: Center(
              child: Text('Start Your Day and Be Productive',style:TextStyles.btextheight20(context)),
            ),
            image: Image.asset(
              Assets.imagesBeproductive,
              fit: BoxFit.cover,
            ),
          ),
          PageViewModel(
            title: title,
           bodyWidget: Center(
             child: Text(' Create multiple to-do lists, add '
                 'tasks with due dates and priorities, and track your progress effortlessly.',
               style:TextStyles.btextheight20(context),),
           ),
            image: Image.asset(
              Assets.imagesLoginpageimage,
              fit: BoxFit.cover,
            ),
          ),
          PageViewModel(
            title: title,
            bodyWidget: Center(
              child: Text('Stay on top of your tasks with reminders and '
              'notifications. Boost your productivity and achieve your goals with MyTasks. ',
                  style:TextStyles.btextheight20(context)
              ),
            ),
            image: Image.asset(
              Assets.imagesReminderimage,
              fit: BoxFit.cover,
            ),
          ),
        ],
        showBackButton: false,
        showNextButton: true,
        // isBottomSafeArea: true,
        showSkipButton: true,
        skip:  PrimaryButton(onPressed: () {
          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
        }, width: 50, height: 20, child: Text('Skip',style: TextStyle(color: AppColors.ButtonTextcolor),),),
        // MyTextButton( // Ensure MyTextButton is defined
        //     name: 'Skip',
        //     onTap: () {
        //       // Navigate to the LoginScreen
        //       // Get.off(() => const LoginScreen());
        //     }),
        next: const Icon(
          Icons.arrow_forward,
          color: AppColors.primaryColor, // Ensure AppColors is defined
          size: 30,
        ),
        done: const Text(
          'Continue',
          style: TextStyle(color: Colors.black),
        ),
        onDone: () {
          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
        },
        dotsDecorator: DotsDecorator(
            size: const Size(10, 15),
            activeColor: AppColors.primaryColor,
            activeSize: const Size(10, 15),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            )),
      ),
    );
  }
}
