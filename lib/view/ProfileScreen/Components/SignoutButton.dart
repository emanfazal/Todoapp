import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:provider/provider.dart';

import '../../../controllers/usercontroller.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return
      PopupMenuButton<String>(
        surfaceTintColor: AppColors.Gradient1,
        shadowColor: AppColors.primaryColor,
        icon: Icon(Icons.edit),
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
      );

  }
}
