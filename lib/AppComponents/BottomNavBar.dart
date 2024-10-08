import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/utils.dart';
import '../Providers/BottomNavProvider.dart';
import '../view/TaskScreen/TaskScreen.dart';
import '../view/CalenderScreen/CalenderScreen.dart';
import '../view/ProfileScreen/ProfileScreen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _getBody(provider.currentIndex),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primaryColor,
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.setIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_rounded),
                  label: 'Calender',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return TaskScreen();
      case 1:
        return CalenderScreen();
      case 2:
        return ProfileScreen();
      default:
        return TaskScreen();
    }
  }
}
