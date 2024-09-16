import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Components/ProfileBody.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final User? user = FirebaseAuth.instance.currentUser;


    if (user == null) {
      return Scaffold(
        body: Center(child: Text('User not signed in')),
      );
    }


    final String userName = user.displayName ?? 'User';

    return Scaffold(

      body: SafeArea(child: ProfileBody(),),
    );
  }
}
