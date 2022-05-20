import 'package:diet_application/src/components/CustomScaffold/custom_scaffold.dart';
import "package:flutter/material.dart";

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = "/profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Text("Profile"),
      child: Text("Profile Screen"),
    );
  }
}
