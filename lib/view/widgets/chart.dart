import 'package:flutter/material.dart';
import '../../models/expense_bucket_model.dart';
import '../../models/expense_model.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.expenses}) : super(key: key);
  final List<ExpenseModel> expenses;

  // get buckets for all categories
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.Food),
      ExpenseBucket.forCategory(expenses, Category.Entertainment),
      ExpenseBucket.forCategory(expenses, Category.Work),
      ExpenseBucket.forCategory(expenses, Category.Travel),
      ExpenseBucket.forCategory(expenses, Category.Health),
    ];
  }

// get max total expenses
  double get maxTotalExpenses {
    double maxTotalExpenses = 0;
    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpenses) {
        maxTotalExpenses = element.totalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    // to get the brightness of the platform
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsetsDirectional.all(16.0),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      width: double.infinity,
      height: 180.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final element in buckets)
                  ChartBar(
                    fill: element.totalExpenses == 0
                        ? 0
                        : element.totalExpenses / maxTotalExpenses,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            children: buckets
                .map((e) => Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[e.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),),).toList(),
          ),
        ],
      ),
    );
  }
}
