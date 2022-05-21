import 'package:diet_application/src/components/SideNav/side_nav.dart';
import 'package:diet_application/src/components/SideNav/styles.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.title, required this.child})
      : super(key: key);

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
