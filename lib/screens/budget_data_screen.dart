import 'package:flutter/material.dart';
import 'package:pbp_assignment_flutter/components/drawer_component.dart';
import 'package:pbp_assignment_flutter/main.dart';
import 'package:provider/provider.dart';

class BudgetDataScreen extends StatelessWidget {
  const BudgetDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> budgets = Provider.of<BudgetModel>(context).getBudgets;

    return Scaffold(
        appBar: AppBar(title: const Text("Budget Data")),
        drawer: const DrawerComponents(currentPage: "Budget Data"),
        body: ListView(
            padding: const EdgeInsets.all(12),
            children: budgets
                .map((budget) => SizedBox(
                    height: 88,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 64),
                                        child: Text(budget['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                      Text(budget['date']),
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(budget['amount'].toString()),
                                      Text(
                                        budget['type'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: budget['type'] == "Income"
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ))))
                .toList()));
  }
}
