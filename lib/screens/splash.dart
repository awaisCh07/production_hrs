import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryLightColor, kPrimaryDarkColor],
          ),
        ),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Image(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              image: const AssetImage('assets/images/prd-logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
