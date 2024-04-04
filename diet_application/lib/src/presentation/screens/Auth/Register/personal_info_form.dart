import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:diet_application/src/presentation/screens/Home/home.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({Key? key}) : super(key: key);

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  String gender = "Male";
  int activity = 1;

  List genders = ["Male", "Female", "Rather Not Say"];

  void setGender(dynamic val) {
    setState(() {
      gender = val;
    });
  }

  void setPhysicalActivity(dynamic val) {
    setState(() {
      activity = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(label: Text("Age")),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
            items: genders
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: setGender,
            decoration: const InputDecoration(label: Text("Gender"))),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(label: Text("Height (cm)")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(label: Text("Weight (kg)")),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
            items: List.generate(7, (index) => index)
                .map((e) => DropdownMenuItem(
                    value: e + 1,
                    child: Text(e == 0 ? "1 Day" : "${e + 1} Days")))
                .toList(),
            onChanged: setPhysicalActivity,
            decoration: const InputDecoration(
                label: Text("Physical activity in a week"))),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(HomeScreen.routeName),
            style: SignInStyles.buttonStyle,
            child: const Text("Register"))
      ],
    ));
  }
}
