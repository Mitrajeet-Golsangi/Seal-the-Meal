import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.subheading}) : super(key: key);
  final String subheading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Let's Register your Account",
            style: RegisterStyles.heading),
        const SizedBox(
          height: 10,
        ),
        Text(
          subheading,
          style: RegisterStyles.subheading,
        )
      ],
    );
  }
}
