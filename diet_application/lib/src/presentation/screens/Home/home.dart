import 'package:diet_application/src/presentation/SideNav/CustomScaffold/custom_scaffold.dart';
import 'package:diet_application/src/presentation/screens/Home/CircularIndicator.dart';
import 'package:diet_application/src/presentation/screens/Home/styles.dart';
import 'package:diet_application/src/presentation/screens/Menu/menu.dart';
import 'package:diet_application/src/presentation/styles/colors.dart';
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

  List<String> items = List.generate(10, (i) => "Dish $i");

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
            SizedBox(
              height: 200,
              child: Scrollbar(
                radius: const Radius.circular(100),
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Menu.routeName),
              style: HomeStyles.menuBtn,
              child: const Text("Get Details"),
            )
          ],
        ),
      ),
    );
  }
}
