import 'package:flutter/material.dart';
import 'package:testing_functionalities_flutter/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 20,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(expense.title,
                    style: GoogleFonts.acme(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("\$${expense.amount.toStringAsFixed(2)}"),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          categoryIcons[expense.category],
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 10),
                        Text(expense.formattedDate),
                        // Text(expense.category.name)
                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}
