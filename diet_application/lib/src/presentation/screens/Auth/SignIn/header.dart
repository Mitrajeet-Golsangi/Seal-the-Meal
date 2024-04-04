import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 30,
        ),
        Text("Let's Sign you in", style: SignInStyles.heading),
        SizedBox(
          height: 10,
        ),
        Text("Welcome Back \n", style: SignInStyles.subheading),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
