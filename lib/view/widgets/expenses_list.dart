import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/view/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList, required this.onRemoveExpense,
  });

  final List<ExpenseModel> expensesList;
  final void Function(ExpenseModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expensesList[index]),
          onDismissed: (direction) =>  onRemoveExpense(expensesList[index]),
          background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.6),),
          child: ExpensesItem(
            expenseModel: expensesList[index],
          ),
        );
      },
    );
  }
}
