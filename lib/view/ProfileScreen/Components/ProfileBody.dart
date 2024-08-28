import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Providers/UserProvider.dart';
import 'SignoutButton.dart';


class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the UserProvider
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.user?.displayName ?? 'Guest';

    return Column(
      children: [
        // Display the user's name at the top
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                'Hello, $userName!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              SignOutButton(),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
