import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/assets.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesLoginpageimage),
      ],
    );
  }
}
