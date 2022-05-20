import 'package:diet_application/src/components/SideNav/styles.dart';
import 'package:diet_application/src/screens/Auth/log_out.dart';
import 'package:diet_application/src/screens/Explore/explore.dart';
import 'package:diet_application/src/screens/Home/home.dart';
import 'package:diet_application/src/screens/Profile/profile.dart';
import 'package:diet_application/src/screens/Workout/workout.dart';
import 'package:diet_application/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightGreen,
            actionsIconTheme: IconThemeData(
              color: ProjectColors.primary,
            ),
            titleTextStyle: Styles.heading,
          )),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Explore.routeName:
                    return const Explore();
                  case Profile.routeName:
                    return const Profile();
                  case Workout.routeName:
                    return const Workout();
                  case LogOut.routeName:
                    return const LogOut();
                  default:
                    return const HomeScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
