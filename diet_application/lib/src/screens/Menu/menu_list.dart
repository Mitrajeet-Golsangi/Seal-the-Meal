import 'package:diet_application/src/screens/Menu/menu_details.dart';
import 'package:diet_application/src/screens/Menu/styles.dart';
import 'package:diet_application/src/styles/colors.dart';
import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  MenuListTile(
      {Key? key,
      required this.title,
      required this.units,
      required this.items,
      this.height = 110.0,
      this.img = "MenuHeader.png"})
      : super(key: key);

  String title;
  String units;
  List<String> items;
  double height;
  String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$title ($units)".toUpperCase()),
          const Divider(
            color: Colors.black87,
            thickness: 1,
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  hoverColor: ProjectColors.placeholder,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: Text("\u2022 ${items[index]}"),
                );
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuDetails(
                              type: title,
                              img: img,
                              items: items,
                            ))),
                style: MenuStyles.textBtn,
                child: const Text(
                  "Know More",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
