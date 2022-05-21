import 'package:diet_application/src/SideNav/SideNav/styles.dart';
import 'package:diet_application/src/screens/Auth/log_out.dart';
import 'package:diet_application/src/screens/Explore/explore.dart';
import 'package:diet_application/src/screens/Home/home.dart';
import 'package:diet_application/src/screens/Menu/menu.dart';
import 'package:diet_application/src/screens/Profile/profile.dart';
import 'package:diet_application/src/screens/Workout/workout.dart';
import 'package:diet_application/src/styles/colors.dart';
import 'package:flutter/material.dart';

class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  void routeTo(BuildContext context, String route) {
    bool sameRoutes = false;

    Navigator.of(context).popUntil((currentRoute) {
      if (currentRoute.settings.name == route) {
        sameRoutes = true;
      }
      return true;
    });

    if (!sameRoutes) {
      Navigator.of(context).pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? currentPage = ModalRoute.of(context)!.settings.name;

    return Drawer(
      width: 250,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            color: Colors.lightGreen,
            height: 10,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Seal The Meal !",
                    style: Styles.heading,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Eat | Sweat | Repeat",
                    style: Styles.subheadingStyle,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: ProjectColors.placeholder,
            indent: 5,
            endIndent: 5,
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == HomeScreen.routeName,
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => routeTo(context, HomeScreen.routeName),
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == Menu.routeName,
            leading: const Icon(Icons.restaurant_menu),
            title: const Text("Menu"),
            onTap: () => routeTo(context, Menu.routeName),
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == Workout.routeName,
            leading: const Icon(Icons.self_improvement),
            title: const Text("Workout"),
            onTap: () => routeTo(context, Workout.routeName),
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == Explore.routeName,
            leading: const Icon(Icons.emoji_emotions),
            title: const Text("Explore"),
            onTap: () => routeTo(context, Explore.routeName),
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == Profile.routeName,
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => routeTo(context, Profile.routeName),
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == LogOut.routeName,
            leading: const Icon(Icons.follow_the_signs),
            title: const Text("Log Out"),
            onTap: () => routeTo(context, LogOut.routeName),
          )
        ],
      ),
    );
  }
}

/* 
ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          TextButton.icon(
            style: Styles.drawerButton,
            icon: const Icon(Icons.arrow_back, color: ProjectColors.primary),
            label: const Text(
              "Seal The Meal",
              style: Styles.heading,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const Divider(
            color: ProjectColors.placeholder,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            selectedColor: ProjectColors.primary,
            selectedTileColor: Colors.grey[200],
            selected: currentPage == HomeScreen.routeName,
            leading: const Icon(Icons.home_filled),
            title: const Text("Home"),
            onTap: () => routeTo(context, HomeScreen.routeName),
          ),
          const ListTile(
            leading: Icon(Icons.self_improvement),
            title: Text("Workout"),
          ),
          ListTile(
            leading: const Icon(Icons.emoji_symbols),
            title: const Text("Explore"),
            onTap: () => routeTo(context, Explore.routeName),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
          const ListTile(
            leading: Icon(Icons.follow_the_signs),
            title: Text("Log Out"),
          )
        ],
      ),
*/