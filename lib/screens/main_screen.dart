import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_functionalities_flutter/providers/expenseProvider.dart';
import 'package:testing_functionalities_flutter/widgets/charts/chart.dart';
import 'package:testing_functionalities_flutter/widgets/charts/chart_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_functionalities_flutter/widgets/expenses_list.dart';
import 'package:testing_functionalities_flutter/widgets/new_expense.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _openExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(0.0),
      )),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total sum is : \$${provider.calculateTotal().toStringAsFixed(2)}',
          style: GoogleFonts.adventPro(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _openExpenseOverlay(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ChartBar(),
          const ExpensesList(),
          const Divider(),
          // Chart(expenses: provider.expenses),
          // for (final bucket in provider.expenses) Text(bucket.title)
        ],
      )),
    );
  }
}
