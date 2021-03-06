import 'package:flutter/material.dart';

import '../utils/authentication.dart';
import '../widgets/custom_snack_bar.dart';
import 'secret_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Tap to move to next screen'),
            ElevatedButton(
                onPressed: () async {
                  bool isAuthenticated =
                      await Authentication.authenticateWithBiometric();

                  if (isAuthenticated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecretScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                        content: 'Error authenticating using Biometrics'));
                  }
                },
                child: Text('Tap'))
          ],
        ),
      ),
    );
  }
}
