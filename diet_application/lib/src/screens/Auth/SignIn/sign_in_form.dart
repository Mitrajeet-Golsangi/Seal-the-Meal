import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Username"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
            obscureText: true,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: Colors.black),
            child: const Text("Forgot Password ?"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 40),
              primary: Colors.black,
            ),
            child: const Text("Sign In"),
          )
        ],
      ),
    );
  }
}
