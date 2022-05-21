import 'package:diet_application/src/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);
  static const routeName = "/workout";

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  List<Map<String, dynamic>> workouts = [
    {
      "type": "Cardio Exercises",
      "activities": ["Cycling", "Treadmill", "Running", "Swimming"]
    },
    {
      "type": "Weight training",
      "activities": ["Bicep Curls", "Dead Lift", "Squats"]
    },
    {
      "type": "Sports",
      "activities": ["Tennis", "Badminton", "Cricket", "Football"]
    },
    {
      "type": "strength and endurance",
      "activities": ["Squats", "Push ups", "Planks", "Shoulder Press"]
    },
  ];

  Map<String, bool> switchVal = {"init": false};

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < workouts.length; i++) {
      for (int j = 0; j < workouts[i]['activities'].length; j++) {
        switchVal.addAll({workouts[i]['activities'][j]: false});
      }
    }
  }

  void toggleSwitch(bool s, String i) {
    setState(() => switchVal[i] = s);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: const Text("Workout"),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 500,
          child: Scrollbar(
            thumbVisibility: true,
            interactive: true,
            thickness: 5,
            child: ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Text(workouts[i]['type'].toString().toUpperCase()),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: workouts[i]['activities'].length * 70.0,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: workouts[i]['activities'].length,
                        itemBuilder: (context, j) {
                          return ListTile(
                            title: Text(workouts[i]['activities'][j]),
                            trailing: Switch(
                              onChanged: (bool value) => toggleSwitch(
                                  value, workouts[i]['activities'][j]),
                              value: switchVal[workouts[i]['activities'][j]]!,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
