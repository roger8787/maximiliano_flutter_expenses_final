import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_functionalities_flutter/providers/expenseProvider.dart';
import 'package:testing_functionalities_flutter/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

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
                    color: Colors.red,
                  ),
                  key: Key(value.expenses[index].id),
                  onDismissed: (_) {
                    value.deleteExpense(id: value.expenses[index].id);
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
