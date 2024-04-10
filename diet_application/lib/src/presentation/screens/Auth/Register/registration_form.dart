import 'package:diet_application/src/presentation/screens/Auth/Register/personal_info.dart';
import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text("Name")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(label: Text("Phone")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(label: Text("Email")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(label: Text("Password")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(label: Text("Confirm Password")),
        ),
        const SizedBox(
          height: 50,
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
