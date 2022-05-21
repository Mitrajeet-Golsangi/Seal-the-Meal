import 'package:diet_application/src/screens/Auth/SignIn/header.dart';
import 'package:diet_application/src/screens/Auth/SignIn/register_now.dart';
import 'package:diet_application/src/screens/Auth/SignIn/sign_in_divider.dart';
import 'package:diet_application/src/screens/Auth/SignIn/sign_in_form.dart';
import 'package:diet_application/src/screens/Auth/SignIn/social_login.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: const [
            Header(),
            SignInForm(),
            SizedBox(
              height: 5,
            ),
            SignInDivider(),
            SizedBox(
              height: 20,
            ),
            SocialLogin(),
            SizedBox(
              height: 10,
            ),
            RegisterNow()
          ]),
        ),
      ),
    );
  }
}
