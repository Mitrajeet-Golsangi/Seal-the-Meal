import 'package:diet_application/src/presentation/screens/Auth/Register/header.dart';
import 'package:diet_application/src/presentation/screens/Auth/Register/registration_form.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Header(subheading: "Hope you have a healthy journey!"),
            SizedBox(
              height: 10,
            ),
            RegistrationForm(),
          ]),
        ),
      ),
    );
  }
}
