import 'package:diet_application/src/data/repositories/authentication_repository.dart';
import 'package:diet_application/src/logic/cubits/login/login_cubit.dart';
import 'package:diet_application/src/presentation/screens/Auth/SignIn/header.dart';
import 'package:diet_application/src/presentation/screens/Auth/SignIn/register_now.dart';
import 'package:diet_application/src/presentation/screens/Auth/SignIn/sign_in_divider.dart';
import 'package:diet_application/src/presentation/screens/Auth/SignIn/sign_in_form.dart';
import 'package:diet_application/src/presentation/screens/Auth/SignIn/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocProvider(
            create: (context) =>
                LoginCubit(context.read<AuthenticationRepository>()),
            child: Column(children: const [
              Header(),
              SignInForm(),
              SizedBox(
                height: 5,
              ),
              SignInDivider(),
              SizedBox(
                height: 20,
              ),
              SocialLogin(),
              SizedBox(
                height: 10,
              ),
              RegisterNow()
            ]),
          ),
        ),
      ),
    );
  }
}
