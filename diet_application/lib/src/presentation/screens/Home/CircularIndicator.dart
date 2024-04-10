import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  CircularIndicator({super.key,
      this.color = Colors.blue,
      this.showBoth = true,
      required this.value,
      required this.total,
      required this.indicationText});

  int value = 0;
  int total;
  Color color;
  String indicationText;
  bool showBoth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              minRadius: 40,
              child:
                  showBoth ? Text("$value / $total") : Text(value.toString()),
            ),
          ],
        ),
      ],
    );
  }
}
