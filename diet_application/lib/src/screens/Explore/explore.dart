import 'package:diet_application/src/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);
  static const routeName = "/explore";

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Text("Explore"),
      child: Text("Explore Screen"),
    );
  }
}
