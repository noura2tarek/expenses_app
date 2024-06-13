import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_strings.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseModel expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final now = DateTime.now();
  final formatter = DateFormat.yMd();
  Category? _selectedCategory = Category.Entertainment;

  DateTime? _selectedDate;

  //dispose
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*------ title text field -----*/
          TextField(
            keyboardType: TextInputType.text,
            maxLength: 50,
            controller: _titleController,
            decoration: InputDecoration(
              labelText: AppStrings.title,
            ),
          ),
          Row(
            children: [
              /*------ amount text field -----*/
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: AppStrings.amount,
                    prefixText: '\$',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? AppStrings.noDataSelected
                        : formatter.format(_selectedDate!), style: Theme.of(context).textTheme.bodyMedium,),
                    IconButton(
                      padding:  EdgeInsets.zero,
                      onPressed: () {
                        /*------- Date Picker --------*/
                        showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: now,
                          lastDate: DateTime(now.year + 1, now.month, now.day),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              _selectedDate = value;
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          /*------ Drop down Button -----*/
          DropdownButton(
            value: _selectedCategory,
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
            items: Category.values
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e.name, style: Theme.of(context).textTheme.bodyMedium,),
                    value: e,
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(_amountController.text);
                  final bool amountIsInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    // show alert dialog to notify the user
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(AppStrings.invalidInput, style: Theme.of(context).textTheme.bodyLarge,),
                          content: Text(
                              AppStrings.makeSure, style: Theme.of(context).textTheme.bodyMedium,),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(AppStrings.ok)),
                          ],
                        );
                      },
                    );
                  } else {
                     // add new expense
                    widget.onAddExpense(ExpenseModel(
                      title: _titleController.text,
                      amount: enteredAmount,
                      date: _selectedDate!,
                      category: _selectedCategory!,
                    ));
                    Navigator.pop(context);
                   
                  }
                },
                child: Text((AppStrings.saveExpenses)),
              ),
              SizedBox(width: 30.0,),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppStrings.cancel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
