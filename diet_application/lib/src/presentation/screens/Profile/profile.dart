import 'package:diet_application/src/data/repositories/authentication_repository.dart';
import 'package:diet_application/src/logic/blocs/authentication/authentication_bloc.dart';
import 'package:diet_application/src/presentation/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:diet_application/src/presentation/screens/Profile/profile_divider.dart';
import 'package:diet_application/src/presentation/screens/Profile/profile_row.dart';
import 'package:diet_application/src/presentation/screens/Profile/styles.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocProvider(
            create: (context) => AuthenticationBloc(
                authRepo: context.read<AuthenticationRepository>()),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                print(state);
                return Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        minRadius: 45,
                        backgroundImage: state.user.photo != null
                            ? NetworkImage(state.user.photo!)
                            : null,
                      ),
                      Text(
                        state.user.name!,
                        style: ProfileStyles.nameText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ProfileDivider(title: "Personal Information"),
                  ProfileRow(
                    leading: "Name",
                    trailing: state.user.name != null
                        ? state.user.name!
                        : "No Display Name",
                  ),
                  ProfileRow(
                    leading: "Email",
                    trailing: state.user.email != null
                        ? state.user.email!
                        : "No Email",
                  ),
                  ProfileDivider(title: "Health Information"),
                  const ProfileRow(leading: "Age", trailing: "34"),
                  const ProfileRow(leading: "Weight", trailing: "47 KG"),
                  const ProfileRow(leading: "Height", trailing: "175 CM"),
                ]);
              },
            ),
          ),
        ));
  }
}
