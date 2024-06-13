import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

// this is one item in the expenses list in home screen
class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expenseModel});

  final ExpenseModel expenseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          children: [
            Text(
              expenseModel.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  '\$${expenseModel.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                const Spacer(),
                Icon(
                  categoryIcons[expenseModel.category],
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  expenseModel.formattedDate,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
