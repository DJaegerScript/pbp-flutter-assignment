# Assignment 7: Flutter Basic Elements

## Name: Adjie Djaka Permana

## NPM: 2106702485

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
