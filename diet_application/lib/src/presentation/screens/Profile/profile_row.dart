import 'package:diet_application/src/presentation/screens/Profile/styles.dart';
import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key, required this.leading, required this.trailing});

  final String leading, trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leading, style: ProfileStyles.profileRowLabel),
            Text(trailing),
          ],
        ),
        const Divider(thickness: 1),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
