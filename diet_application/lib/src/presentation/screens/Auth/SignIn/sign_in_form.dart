import 'package:diet_application/src/logic/cubits/login/login_cubit.dart';
import 'package:diet_application/src/presentation/screens/Auth/styles.dart';
import 'package:diet_application/src/presentation/screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              TextFormField(
                onChanged: (value) =>
                    context.read<LoginCubit>().emailChanged(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "This field is required";
                  } else if (!val.isValidEmail()) {
                    return "Please Enter valid email!";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "This field is required";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) =>
                    context.read<LoginCubit>().passwordChanged(value),
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
                obscureText: true,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: const Text("Forgot Password ?"),
              ),
              const SizedBox(
                height: 10,
              ),
              state.status == LoginStatus.submitting
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                          if (state.status == LoginStatus.error) {
                            final snackBar =
                                SnackBar(content: Text(state.error));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          if (state.status == LoginStatus.success) {
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          }
                        }
                      },
                      style: SignInStyles.buttonStyle,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
