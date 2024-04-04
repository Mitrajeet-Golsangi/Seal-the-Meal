import 'package:flutter/material.dart';

class SignInStyles {
  static const TextStyle heading = TextStyle(
    color: Colors.black,
    fontSize: 37,
    fontFamily: "Outfit",
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subheading = TextStyle(
    color: Colors.black,
    fontSize: 28,
  );

  static const TextStyle dividerText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: "Outfit",
    fontWeight: FontWeight.w500,
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(400, 40),
    primary: Colors.black,
  );
}

class RegisterStyles {
  static const TextStyle heading = TextStyle(
    color: Color(0xff197112),
    fontSize: 23,
    fontFamily: "Roboto",
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subheading = TextStyle(
    color: Colors.black,
    fontSize: 28,
  );
}
