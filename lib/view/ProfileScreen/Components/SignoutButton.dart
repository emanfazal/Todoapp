import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:provider/provider.dart';

import '../../../controllers/usercontroller.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return PopupMenuButton<String>(
      surfaceTintColor: AppColors.Gradient1,
      shadowColor: AppColors.primaryColor,
      icon: Center(
        child: Icon(
          size: 40,
          Icons.logout_rounded,
          color: AppColors.Gradient2
        ),
      ),
      onSelected: (String value) {
        if (value == 'Sign Out') {
          authProvider.signOut(context);
          print("Sign Out selected");
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Sign Out',
            child: Text('Sign Out'),
          ),
        ];
      },
      offset: Offset(50, -20), // Adjust this offset as needed to position the menu
    );
  }
}
