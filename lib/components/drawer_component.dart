import 'package:flutter/material.dart';
import 'package:pbp_assignment_flutter/main.dart';
import 'package:pbp_assignment_flutter/screens/add_budget_info_screen.dart';
import 'package:pbp_assignment_flutter/screens/budget_data_screen.dart';
import 'package:pbp_assignment_flutter/screens/counter_7_screen.dart';
import 'package:provider/provider.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    var currentScreen = Provider.of<ScreenState>(context).getCurrentScreen;

    return Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Counter 7",
            style: currentScreen == 0
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Counter 7") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Counter7()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Add Budget Info",
            style: currentScreen == 1
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Add Budget Info") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(1);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddBudgetInfoScreen()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Budget Data",
            style: currentScreen == 2
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Budget Data") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(2);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetDataScreen()));
            }
          },
        )
      ],
    ));
  }
}
