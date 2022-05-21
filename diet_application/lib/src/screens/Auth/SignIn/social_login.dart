import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          child: Image.asset('assets/images/icons/facebook_logo.png',
              height: 50, fit: BoxFit.contain),
          onPressed: () {},
        ),
        TextButton(
          child: Image.asset('assets/images/icons/google_logo.png',
              height: 30, fit: BoxFit.contain),
          onPressed: () {},
        ),
        TextButton(
          child: Image.asset('assets/images/icons/apple_logo.png',
              height: 35, fit: BoxFit.contain),
          onPressed: () {},
        )
      ],
    );
  }
}
