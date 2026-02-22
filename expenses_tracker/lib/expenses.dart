import 'package:expenses_tracker/chart.dart';
import 'package:expenses_tracker/expense.dart';
import 'package:expenses_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Working lunch',
      amount: 6.88,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Flutter book',
      amount: 50.99,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      isScrollControlled: true, //set to true, overlay take the full screen
      context: context,
      builder: (ctx) =>
          NewExpense(onAddExpense: _addExpense), //Text("Modal Bottom Sheet")
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverLay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense),
          ), //without Expanded, the inner  Column/ListView will take
          // as tall as children, outer Column takes as much as available, flutter can not resolve it.
          //Expanded tell inner Colunm take the remining space.
        ],
      ),
    );
  }
}
