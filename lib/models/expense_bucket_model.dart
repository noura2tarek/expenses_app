// Expense bucket model
import 'expense_model.dart';

class ExpenseBucket {
  final Category category;
  final List<ExpenseModel> expenses;

  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(
      List<ExpenseModel> allExpenses,
      this.category,
      ) : expenses = allExpenses
      .where((element) => element.category == category)
      .toList();


  // total expenses getter
  double get totalExpenses {
    double sum =0;
    for(var expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }


}