import 'package:expenses_app/core/app_strings.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/view/widgets/expenses_list.dart';
import 'package:expenses_app/view/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../widgets/chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
        title: AppStrings.flutterCourse,
        amount: 50.222,
        date: DateTime.now(),
        category: Category.Work),
    ExpenseModel(
        title: AppStrings.lunch,
        amount: 150.0,
        date: DateTime.now(),
        category: Category.Food),
    ExpenseModel(
        title: AppStrings.gym,
        amount: 200.0,
        date: DateTime.now(),
        category: Category.Health),
    ExpenseModel(
      title: AppStrings.cinema,
      amount: 90.0,
      date: DateTime.now(),
      category: Category.Entertainment,
    ),
    ExpenseModel(
      title: 'Travel',
      amount: 100.0,
      date: DateTime.now(),
      category: Category.Travel,
    ),
  ];

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.expensesTracker,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpense(
                  onAddExpense: _addExpense,
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses,),
          Expanded(
            child: ExpensesList(
              expensesList: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
