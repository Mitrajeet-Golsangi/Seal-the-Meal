import 'package:diet_application/src/screens/Auth/Register/register.dart';
import 'package:diet_application/src/screens/Auth/SignIn/sign_in.dart';
import 'package:diet_application/src/screens/Splash/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/images/splash.jpg',
          height: 360,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text("SEAL THE MEAL", style: ProfileStyles.heading),
        const SizedBox(
          height: 10,
        ),
        const Text("EAT | SWEAT| REPEAT", style: ProfileStyles.subheading),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SignIn.routeName),
              style: ProfileStyles.signInBtn,
              child: const Text("Sign In"),
            ),
            ElevatedButton(
                style: ProfileStyles.registerBtn,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Register.routeName),
                child: const Text("Register"))
          ],
        )
      ]),
    );
  }
}
