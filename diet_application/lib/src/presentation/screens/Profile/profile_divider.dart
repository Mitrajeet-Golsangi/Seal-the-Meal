import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  ProfileDivider({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: const TextStyle(fontSize: 11)),
          const Divider(
            color: Colors.black87,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
