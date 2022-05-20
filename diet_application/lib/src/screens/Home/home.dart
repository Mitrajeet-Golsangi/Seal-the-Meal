import 'package:diet_application/src/components/CustomScaffold/custom_scaffold.dart';
import 'package:diet_application/src/screens/Home/CircularIndicator.dart';
import 'package:diet_application/src/screens/Home/styles.dart';
import 'package:diet_application/src/styles/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeStyles style = HomeStyles();
  int _water = 0;
  int _calories = 100;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: const Text("Home"),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Water", style: HomeStyles.indicatorText),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularIndicator(
                  value: _water,
                  total: 10,
                  indicationText: "Water",
                  color: _water == 10 ? Colors.lightGreen : Colors.blue,
                ),
                ElevatedButton(
                  style: _water == 10
                      ? HomeStyles.indicatorButton(color: Colors.lightGreen)
                      : HomeStyles.indicatorButton(),
                  onPressed: _water == 10
                      ? () => setState(() {
                            _water = 0;
                          })
                      : () => setState(() {
                            _water = _water + 1;
                          }),
                  child: _water == 10
                      ? const Text("Reset ?")
                      : const Text("Drink Now !"),
                )
              ],
            ),
            const SizedBox(height: 15),
            const Text("Calories", style: HomeStyles.indicatorText),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    _calories += 100;
                  }),
                  style:
                      HomeStyles.indicatorButton(color: ProjectColors.purple),
                  child: const Text("Ate Something ? "),
                ),
                CircularIndicator(
                  value: _calories,
                  total: 5000,
                  indicationText: "Calories",
                  color: ProjectColors.purple,
                  showBoth: false,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: ProjectColors.placeholder,
              thickness: 1,
            ),
            Text(
              "Today's Menu".toUpperCase(),
              style: HomeStyles.indicatorText,
            ),
            Image.asset("assets/images/Menu.png"),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("Dish 1"), Text("Dish 6")],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("Dish 2"), Text("Dish 7")],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("Dish 3"), Text("Dish 8")],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("Dish 4"), Text("Dish 9")],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("Dish 5"), Text("Dish 10")],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: HomeStyles.menuBtn,
              child: const Text("Get Details"),
            )
          ],
        ),
      ),
    );
  }
}
