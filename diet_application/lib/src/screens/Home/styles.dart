import 'package:flutter/material.dart';

class HomeStyles {
  static const TextStyle indicatorText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 1.2);

  static ButtonStyle indicatorButton({Color color = Colors.blue}) {
    return ElevatedButton.styleFrom(
      fixedSize: const Size(140, 30),
      primary: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  static ButtonStyle menuBtn = ElevatedButton.styleFrom(
    primary: Colors.black,
    fixedSize: const Size(140, 15),
  );
}
