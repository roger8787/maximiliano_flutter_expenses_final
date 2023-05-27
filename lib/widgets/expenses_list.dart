import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_functionalities_flutter/models/expense.dart';
import 'package:testing_functionalities_flutter/providers/expenseProvider.dart';
import 'package:testing_functionalities_flutter/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  void deleteExpense(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Expense deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (_, value, __) => Expanded(
        child: Container(
          height: 100,
          child: ListView.builder(
              itemCount: value.expenses.length,
              itemBuilder: (_, index) {
                return Dismissible(
                  background: Container(
                      // color: Colors.red,
                      ),
                  key: Key(value.expenses[index].id),
                  onDismissed: (_) {
                    final expenseIndex =
                        value.expenses.indexOf(value.expenses[index]);
                    final Expense expense = value.expenses[index];
                    value.deleteExpense(expense: value.expenses[index]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                value.undoExpense(
                                    index: expenseIndex, expense: expense);
                              }),
                          duration: const Duration(seconds: 3),
                          content: const Text('Expense deleted')),
                    );
                  },
                  child: ExpenseItem(
                    expense: value.expenses[index],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
