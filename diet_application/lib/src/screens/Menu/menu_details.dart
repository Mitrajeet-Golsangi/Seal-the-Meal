import 'package:diet_application/src/SideNav/SideNav/styles.dart';
import 'package:flutter/material.dart';

class MenuDetails extends StatelessWidget {
  MenuDetails(
      {Key? key,
      this.img = "MenuHeader.png",
      required this.items,
      required this.type})
      : super(key: key);

  String img;
  String type;
  List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/$img"),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Food Rich in $type",
            style: Styles.heading,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 330,
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(100),
                thickness: 10,
                interactive: true,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                        leading: Text((i + 1).toString()),
                        title: Text(
                            items[i][0].toUpperCase() + items[i].substring(1)));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
