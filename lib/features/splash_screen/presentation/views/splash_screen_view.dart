import 'package:flutter/material.dart';

import '../../../../config/routes.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Text('Welcome text'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, gameView, (route) => false),
              child: Text('Start game'),
            )
          ],
        ),
      )),
    );
  }
}
