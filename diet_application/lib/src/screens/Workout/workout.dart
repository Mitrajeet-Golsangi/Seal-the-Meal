import 'package:diet_application/src/components/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);
  static const routeName = "/workout";
  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Text("Workout"),
      child: Text("Workout Screen"),
    );
  }
}
