import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppComponents/CustomCard.dart';
import 'package:flutter_application_1/view/ProfileScreen/Components/LanguageSelection.dart';
import 'package:provider/provider.dart';

import '../../../Constants/utils.dart';
import '../../../Providers/ThemeProvider.dart';
import '../../../Providers/UserProvider.dart';
import 'SignoutButton.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.user?.displayName ?? 'Guest';

    // Check if the theme is dark
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Set text color based on the theme (grey or white for dark theme, black for light)
    final Color userNameColor = isDarkTheme ? Colors.grey[300]! : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Display the user's name at the top
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                'Hello, $userName!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: userNameColor, // Dynamic color based on the theme
                ),
              ),
              // const Spacer(),
              // const SignOutButton(),
            ],
          ),
        ),

        const SizedBox(height: 60),

        // Enable Notifications Button
        CustomCard(
          title: 'Enable Notifications',
          value: false,
          onPressed: (value) {},
          icon: Icons.notifications,
        ),

        // Dark Theme Toggle Using CustomCard
        CustomCard(
          value: themeProvider.themeMode == ThemeMode.dark,
          title: 'Dark Theme',
          onPressed: (bool value) {
            themeProvider.toggleTheme(value); // Toggle between dark and light theme
          },
          icon: Icons.dark_mode_outlined,
        ),

        // Select Language Button
        LanguageSelector(),
        SizedBox(height: 40,),
        SignOutButton(),
      ],
    );
  }

  // Function to show the language selection bottom sheet

}
