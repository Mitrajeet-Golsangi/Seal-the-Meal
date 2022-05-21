import 'package:diet_application/src/screens/Auth/Register/header.dart';
import 'package:diet_application/src/screens/Auth/Register/personal_info_form.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);
  static const routeName = "/personal_info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: const [
            SizedBox(
              height: 40,
            ),
            Header(subheading: "Please Enter this essential information"),
            SizedBox(
              height: 10,
            ),
            PersonalInfoForm(),
          ]),
        ),
      ),
    );
  }
}
