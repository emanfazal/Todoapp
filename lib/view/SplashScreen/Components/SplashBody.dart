import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:provider/provider.dart';

import '../../../Providers/Splashprovider.dart';
import '../../../Providers/Splashprovider.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'asset/images/todologo.png',
            height: 200.0,
            width: 200.0,
          ),
        )
      ],
    );
  }
}
