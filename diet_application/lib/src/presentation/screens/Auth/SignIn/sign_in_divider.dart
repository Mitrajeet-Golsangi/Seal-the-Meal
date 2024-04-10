import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:diet_application/src/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: ProjectColors.placeholder,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("or", style: SignInStyles.dividerText),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: ProjectColors.placeholder,
          ),
        ),
      ],
    );
  }
}
