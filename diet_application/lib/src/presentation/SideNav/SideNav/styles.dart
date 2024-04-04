import 'package:diet_application/src/presentation/styles/colors.dart';
import "package:flutter/material.dart";

class Styles {
  static const heading = TextStyle(
    fontSize: 20,
    color: ProjectColors.primary,
  );

  static const drawerButton = ButtonStyle(
    alignment: Alignment.centerLeft,
  );

  static const subheadingStyle =
      TextStyle(fontSize: 11, fontStyle: FontStyle.italic);

  static const appBarIconTheme = IconThemeData(color: ProjectColors.primary);
}
