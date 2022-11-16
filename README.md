# Assignment 8: Flutter Form

## Name: Adjie Djaka Permana

## NPM: 2106702485

1. **Explain the difference between `Navigator.push` and `Navigator.pushReplacement`!**

   `Navigator.push` will navigate the app to the desired screen by add a route to the stack. While, `Navigator.pushReplacement` will do the same thing, but it will replace the route that is at the top of the stack.

2. **List all the widgets you used in this project and explain their functions!**

   In this project, I use these following widgets:

   - `Form()`, used to make a container for a form field.
   - `TextFormField()`, used to create a form field that contains a text field.
   - `DropdownButtonFormField()`, used to create a form field in the form of dropdown button.
   - `ShowDatePicker()`, used to show a material date picker dialog.
   - `ListView()`, used to create a scrollable, linear array of widgets.
   - `Drawer()`, used to create a sidebar.

3. **Name the types of events that exist in Flutter (example: onPressed)!**

   In this project, I use these following events:

   - `onPressed`, used in button, will capture the event when the button is pressed (clicked).
   - `onTap`, used in any other widget besides the button widget, will capture any gesture that is affecting the related widget. Currently, it has the same behavior as the `onPressed` event.
   - `onChange`, used in any form field, will capture the event when the related form field's value changes. Usually, it is used to store the inputted value to the state.

4. **Explain how the Navigator works in "switching" pages of a Flutter application.!**

   Navigator or navigation in a Flutter application is made in a stack structure, where the screen that is at the top of the stack becomes the current screen. the `push` method will add a new screen to the top of the stack making the flutter app navigate to a new screen, while the `pop` method will remove a screen from the top of the stack making the flutter app navigate back to the previous screen.

5. **Explain how you implement the checklist above!**

   At the first, I create the `Drawer` widget in the separate file. It is used to provide the navigation of the Flutter application.

   After that, I create the `AddBudgetInfoScreen`. At that screen, I create a form along its fields with the date picker for bonuses. Then, to store the data inputted from the form and to make it accessible in any screen, I create a state using `Provider`. So, every time the data is inputted by the user, the local state will be updated and every time the user save the data, the data will be saved to the global state.

   Lastly, I create the `BudgetDataScreen`. This screen contains the list of the budget data that is distributed from the data stored in global state.

===================================== **END OF ASSIGNMENT 8** ======================================

# Assignment 7: Flutter Basic Elements

1. **Explain what is meant by stateless widget and stateful widget and explain the difference between them!**

   Simply, stateless widget is the widget that never changes (e.g. `Icon`, `Text`, `IconButton`). On the other hand, stateful widget is a dynamic widget and can be changed based on state or data that are received (e.g. `CheckBox`, `Radio`, `Slider`).

2. **Mention what widgets you use in this project and explain their functions!**

   In this project, I use these following widgets:

   - `Center()`, used to center its child widgets.
   - `Column()`, used to make a column layout for its child widgets.
   - `Text()`, used to display text.
   - `Padding()`, used to give padding for the child widgets.
   - `Row()`, used to make a row layout for its child widgets.
   - `FloatingActionButton()`, used to display a floating action button.

3. **What is the function of setState()? Explain what variables can be affected by the function!**

   `setState()` is a function that can be called inside the `State` object. It is used to changes the value or the state of a variable that is declared in the `State` object.

4. **Explain the difference between const and final!**

   | <p align="center">**Final**</p>      | <p align="center">**Const**</p>             |
   | ------------------------------------ | ------------------------------------------- |
   | Initialized at the runtime           | Initialized at the compile time             |
   | Can be defined in a class & function | Can be defined only in a class              |
   | State update affects `build` method  | State update does not affect `build` method |

5. **Explain how you implement the checklist above!**

   First, I modified the `floatingActionButton` widget with the `Row` widget so that I can place two identical **_fab_** that is horizontally aligned. Then, to avoid layout overflow, I add `FloatingActionButtonLocation.centerFloat` to `floatingActionButtonLocation` and wrap the `Row` widget with `Padding`.

   After that, to handle the state of `_counter`, I create one more state setter called `_decrementCounter`. Then, I put each of the state setters to each **_fab_** `onPressed` event. For the last, I create a conditional statement that will render either `GANJIL` or `GENAP`.
