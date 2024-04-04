import 'package:diet_application/src/presentation/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:diet_application/src/presentation/SideNav/SideNav/styles.dart';
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
    return CustomScaffold(
      title: const Text("Explore"),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Daily Feed !",
                style: Styles.heading,
              )
            ]),
      ),
    );
  }
}
