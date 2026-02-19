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
      title: 'working lunch',
      amount: 6.88,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'flutter book',
      amount: 50.99,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  void _openAddExpenseOverLay(){
    showModalBottomSheet(context: context, 
    builder: (ctx)=> NewExpense(),//Text("Modal Bottom Sheet")
    );
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker") ,
        actions: [IconButton(
        onPressed: _openAddExpenseOverLay,
        icon: Icon(Icons.add))
      ],),
      body: Column(
        children: [
          const Text('Expenses chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ), //without Expanded, the inner  Column/ListView will take
          // as tall as children, outer Column takes as much as available, flutter can not resolve it.
          //Expanded tell inner Colunm take the remining space.
        ],
      ),
    );
  }
}
