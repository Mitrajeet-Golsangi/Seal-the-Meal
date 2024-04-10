import 'package:diet_application/src/logic/cubits/login/login_cubit.dart';
import 'package:diet_application/src/presentation/screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: state.status == LoginStatus.onGoingFacebook
                  ? const CircularProgressIndicator()
                  : Image.asset('assets/images/icons/facebook_logo.png',
                      height: 50, fit: BoxFit.contain),
              onPressed: () {
                context.read<LoginCubit>().loginWithFacebook();
                if (state.status == LoginStatus.success) {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                } else if (state.status == LoginStatus.error) {
                  final snackBar = SnackBar(content: Text(state.error));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            TextButton(
              child: state.status == LoginStatus.onGoingGoogle
                  ? const CircularProgressIndicator()
                  : Image.asset('assets/images/icons/google_logo.png',
                      height: 30, fit: BoxFit.contain),
              onPressed: () {
                context.read<LoginCubit>().loginWithGoogle();
                if (state.status == LoginStatus.success) {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                } else if (state.status == LoginStatus.error) {
                  final snackBar = SnackBar(content: Text(state.error));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            TextButton(
              child: Image.asset('assets/images/icons/apple_logo.png',
                  height: 35, fit: BoxFit.contain),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
