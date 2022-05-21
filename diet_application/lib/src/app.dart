import 'package:diet_application/src/SideNav/SideNav/styles.dart';
import 'package:diet_application/src/screens/Auth/Register/personal_info.dart';
import 'package:diet_application/src/screens/Auth/Register/register.dart';
import 'package:diet_application/src/screens/Auth/SignIn/sign_in.dart';
import 'package:diet_application/src/screens/Explore/explore.dart';
import 'package:diet_application/src/screens/Home/home.dart';
import 'package:diet_application/src/screens/Menu/menu.dart';
import 'package:diet_application/src/screens/Profile/profile.dart';
import 'package:diet_application/src/screens/Splash/splash_screen.dart';
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
              ),
              inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.all(10),
                alignLabelWithHint: true,
                focusColor: ProjectColors.primary,
                fillColor: ProjectColors.primary,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    color: ProjectColors.primary,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ProjectColors.inputBorder,
                  ),
                  gapPadding: 2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: ProjectColors.primary)),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case HomeScreen.routeName:
                    return const HomeScreen();
                  case Explore.routeName:
                    return const Explore();
                  case Profile.routeName:
                    return const Profile();
                  case Workout.routeName:
                    return const Workout();
                  case Menu.routeName:
                    return const Menu();
                  case SplashScreen.routeName:
                    return const SplashScreen();
                  case SignIn.routeName:
                    return const SignIn();
                  case Register.routeName:
                    return const Register();
                  case PersonalInfo.routeName:
                    return const PersonalInfo();
                  default:
                    // return const HomeScreen();
                    return const SplashScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
