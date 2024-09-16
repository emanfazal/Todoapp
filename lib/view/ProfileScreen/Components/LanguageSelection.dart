import 'package:flutter/material.dart';
import '../../../Constants/utils.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Theme.of(context);

    return Card(
      surfaceTintColor: AppColors.primaryColor,
      shadowColor: AppColors.Gradient1,
      elevation: 4,
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: AppColors.Gradient2, // Set icon color
          ),
          SizedBox(width: 8.0), // Add spacing between icon and text
          Text(
            'Select Language',
            // Use appropriate text style
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              _showLanguageSelection(context);
            },
            child: Center(
              child: Text(
                'Select',
                style: TextStyle(
                  color: AppColors.Gradient2, // Button text color
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.Gradient2, backgroundColor: AppColors.ElevatedButtonColor, // Button text color
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0), // Adjust button size and padding
              side: BorderSide(color: AppColors.DarkGrey, width: 2), // Border color and width
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  // Handle language change to English
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Urdu'),
                onTap: () {
                  // Handle language change to Spanish
                  Navigator.pop(context);
                },
              ),

              // Add more language options as needed
            ],
          ),
        );
      },
    );
  }
}
