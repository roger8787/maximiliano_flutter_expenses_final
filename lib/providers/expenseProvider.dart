import 'package:flutter/material.dart';
import 'package:testing_functionalities_flutter/models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  double _suma = 0;
  final List<Expense> _expenses = [
    // Expense(
    //     title: 'Food',
    //     amount: 34.3,
    //     date: DateTime.now(),
    //     category: Category.food),
    // Expense(
    //     title: 'Shoes',
    //     amount: 45.3,
    //     date: DateTime.now(),
    //     category: Category.leisure),
  ];

  List<Expense> get expenses => [..._expenses];
  double get suma => _suma;

  //method to add an expense
  void addExpense({required Expense expense}) {
    _expenses.add(expense);
    notifyListeners();
  }

  void deleteExpense({required String id}) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  double calculateTotal() {
    return _expenses.fold(
        0.0, (previousValue, expense) => previousValue + expense.amount);
    notifyListeners();
  }
}
