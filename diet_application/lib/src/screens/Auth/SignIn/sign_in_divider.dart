import 'package:diet_application/src/screens/Auth/styles.dart';
import 'package:diet_application/src/styles/colors.dart';
import 'package:flutter/material.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
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
