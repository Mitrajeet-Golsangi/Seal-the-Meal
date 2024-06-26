import 'package:diet_application/src/presentation/screens/Auth/Register/register.dart';
import 'package:flutter/material.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have and account ?",
          style: TextStyle(
            letterSpacing: -0.3,
            wordSpacing: -0.5,
          ),
        ),
        TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(Register.routeName),
            child: const Text(
              "Register Now",
              style: TextStyle(
                  letterSpacing: -0.3,
                  wordSpacing: -0.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
