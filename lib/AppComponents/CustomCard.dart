import 'package:flutter/material.dart';

import '../Constants/utils.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onPressed;
  final IconData icon; // Added icon parameter

  const CustomCard({
    Key? key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.icon, // Added icon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.primaryColor,
      shadowColor: AppColors.Gradient1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.Gradient2), // Icon
              SizedBox(width: 8.0), // Space between icon and text
              Text(title),
            ],
          ),
          SwitchTheme(
            data: SwitchThemeData(
              trackColor: MaterialStateProperty.all(AppColors.ElevatedButtonColor), // Track color
              thumbColor: MaterialStateProperty.all(AppColors.Gradient2), // Thumb color
              overlayColor: MaterialStateProperty.all(AppColors.Gradient1.withOpacity(0.2)), // Overlay color when tapped
            ),
            child: Switch(
              value: value,
              onChanged: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
