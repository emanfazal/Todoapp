import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:flutter_application_1/view/TaskScreen/TaskScreen.dart';
import 'package:provider/provider.dart';

import '../../AppComponents/BottomNavBar.dart';
import '../../Providers/BottomNavProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = "/homepage";

  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }
}