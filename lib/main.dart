import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/apptheme.dart';
import 'package:flutter_application_1/Providers/Splashprovider.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/routers.dart';
import 'package:flutter_application_1/view/SplashScreen/Splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Providers/BottomNavProvider.dart';
import 'Providers/TodoProvider.dart';
import 'Services/FirestoreServices/databaseServices.dart';
import 'controllers/usercontroller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
FirebaseFirestore.instance.settings=const Settings(
  persistenceEnabled: true,
);
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
            ChangeNotifierProvider(create: (_) => TodoProvider()),
            ChangeNotifierProvider(create: (_) => BottomNavProvider()),
            ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => UserProvider()),


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
