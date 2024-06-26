import 'package:diet_application/src/presentation/SideNav/SideNav/side_nav.dart';
import 'package:diet_application/src/presentation/SideNav/SideNav/styles.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.title, required this.child});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        iconTheme: Styles.appBarIconTheme,
      ),
      body: SingleChildScrollView(child: child),
      drawer: const SideNav(),
    );
  }
}
