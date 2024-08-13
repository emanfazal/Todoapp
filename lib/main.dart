import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/apptheme.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/routers.dart';
import 'package:flutter_application_1/view/SplashScreen/Splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: routes,
            theme: AppTheme.light,
          ),
        );
      },
    );
  }
}
