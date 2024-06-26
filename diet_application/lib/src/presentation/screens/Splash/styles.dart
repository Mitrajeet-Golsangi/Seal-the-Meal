import 'package:flutter/material.dart';

class ProfileStyles {
  static const TextStyle heading = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontFamily: "Outfit",
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subheading = TextStyle(
    color: Colors.black,
    fontSize: 19,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static ButtonStyle signInBtn = ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    fixedSize: const Size(110, 30),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.zero,
        bottomRight: Radius.zero,
        bottomLeft: Radius.circular(5),
        topLeft: Radius.circular(5),
      ),
    ),
  );
  static ButtonStyle registerBtn = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff6e77f6),
    fixedSize: const Size(110, 30),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.zero,
        bottomLeft: Radius.zero,
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    ),
  );
}
