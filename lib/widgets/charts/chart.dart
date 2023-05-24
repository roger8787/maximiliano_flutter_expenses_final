import 'package:flutter/material.dart';
import 'package:testing_functionalities_flutter/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<Map<String, dynamic>> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food).toMap(),
      ExpenseBucket.forCategory(expenses, Category.leisure).toMap(),
      ExpenseBucket.forCategory(expenses, Category.travel).toMap(),
      ExpenseBucket.forCategory(expenses, Category.work).toMap(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(buckets);
    return Container(
      color: Colors.pink,
      height: 200,
      child: Text('expenses'),
    );
  }
}
