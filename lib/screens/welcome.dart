import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  image: const AssetImage('assets/images/prd-logo.png'),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.12,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: kPrimaryLightColor),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0)), // Rectangular shape
                    backgroundColor: kPrimaryDarkColor,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
