import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/utils.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.BackgroundColor,
      backgroundColor: AppColors.BackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor, // Background color of the BottomNavigationBar
        selectedItemColor: Colors.black, // Color for the selected icon and label
        unselectedItemColor: Colors.white, // Color for unselected icons and labels
        selectedIconTheme: IconThemeData(color: Colors.black), // Custom icon theme for selected item
        unselectedIconTheme: IconThemeData(color: Colors.white), // Custom icon theme for unselected items
        showUnselectedLabels: true,
        // Optional: Display labels for unselected items
      ),
    );
  }
}
