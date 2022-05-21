import 'package:diet_application/src/screens/Auth/Register/personal_info.dart';
import 'package:diet_application/src/screens/Auth/styles.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text("Name")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Username")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(label: Text("Phone")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(label: Text("Email")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(label: Text("Password")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(label: Text("Confirm Password")),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(PersonalInfo.routeName),
            style: SignInStyles.buttonStyle,
            child: const Text("Next"))
      ],
    ));
  }
}
