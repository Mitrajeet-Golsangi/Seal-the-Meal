import 'package:diet_application/src/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:diet_application/src/screens/Profile/profile_divider.dart';
import 'package:diet_application/src/screens/Profile/profile_row.dart';
import 'package:diet_application/src/screens/Profile/styles.dart';
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
    return CustomScaffold(
        title: const Text("Profile"),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircleAvatar(
                  minRadius: 45,
                  backgroundImage: AssetImage("assets/images/Menu.png"),
                ),
                Text(
                  "Mitrajeet Golsangi",
                  style: ProfileStyles.nameText,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ProfileDivider(title: "Personal Information"),
            const ProfileRow(
              leading: "Name",
              trailing: "Mitrajeet Golsangi",
            ),
            const ProfileRow(
              leading: "Email",
              trailing: "mitrajeetgolsangi@gmail.com",
            ),
            ProfileDivider(title: "Health Information"),
            const ProfileRow(leading: "Age", trailing: "34"),
            const ProfileRow(leading: "Weight", trailing: "47 KG"),
            const ProfileRow(leading: "Height", trailing: "175 CM"),
          ]),
        ));
  }
}
