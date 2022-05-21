import 'package:diet_application/src/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);
  static const routeName = "/logout";

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Text("Log Out"),
      child: Text("Log Out Screen"),
    );
  }
}
