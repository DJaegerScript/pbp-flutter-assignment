import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pbp_assignment_flutter/components/drawer_component.dart';
import 'package:pbp_assignment_flutter/main.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddBudgetInfoScreen extends StatefulWidget {
  const AddBudgetInfoScreen({super.key});

  final String title = "Add Budget Info";

  @override
  State<AddBudgetInfoScreen> createState() => _AddBudgetInfoScreenState();
}

class _AddBudgetInfoScreenState extends State<AddBudgetInfoScreen> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _amount = 0;
  String _type = 'Choose Type';
  List<String> types = ['Choose Type', 'Income', 'Expense'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerComponents(currentPage: "Add Budget Info"),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      // Using padding of 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Food",
                          labelText: "Title",
                        ),
                        // Added behavior when name is typed
                        onChanged: (String? value) {
                          setState(() {
                            _title = value!;
                          });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Title cannot be empty!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Padding(
                          // Using padding of 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            decoration: const InputDecoration(
                              hintText: "Amount",
                              labelText: "Amount",
                            ),
                            // Added behavior when name is typed
                            onChanged: (String? value) {
                              setState(() {
                                _amount = value == null
                                    ? 0
                                    : value.isNotEmpty
                                        ? int.parse(value)
                                        : 0;
                              });
                            },
                            // Validator as form validation
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Amount cannot be empty!';
                              }
                              return null;
                            },
                          ),
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField(
                              hint: const Text("Choose Type"),
                              value: _type,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: types.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _type = value ?? "";
                                });
                              },
                              validator: (String? value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "Choose Type") {
                                  return 'Type cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: dateInput,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "Enter Date"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                dateInput.text =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                              });
                            }
                          },
                        ))
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var budget = {
                        "title": _title,
                        "amount": _amount,
                        "type": _type,
                        "date": dateInput.text
                      };

                      Provider.of<BudgetModel>(context, listen: false)
                          .addBudget(budget);

                      _formKey.currentState?.reset();

                      setState(() {
                        _type = 'Choose Type';
                        dateInput.text = "";
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Data has been saved!")));
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
