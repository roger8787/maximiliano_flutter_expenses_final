import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testing_functionalities_flutter/providers/expenseProvider.dart';
import '../models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //variables
  DateTime? _date;
  Category _selectedCategory = Category.food;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountControler = TextEditingController();

  //method that opens a DatePicker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    if (date == null) return;

    setState(() {
      _date = date;
    });
  }

  //method to submit data and validate it
  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountControler.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || _date == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Invalid input'),
              content: const Text('please fill the right information'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            );
          });

      return;
    }

    //calling provider to add the expense in the list of expenses
    final Expense expense = Expense(
      title: _titleController.text,
      amount: double.parse(_amountControler.text),
      category: _selectedCategory,
      date: _date!,
    );

    Provider.of<ExpenseProvider>(context, listen: false)
        .addExpense(expense: expense);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountControler,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$',
                      labelText: 'Amount',
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_date == null
                            ? 'no selected date'
                            : formatter.format(_date!)),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month_outlined),
                        ),
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            //Dropdown and cancel save expense
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory,
                    elevation: 10,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase())))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    OutlinedButton(
                        onPressed: _submitExpense,
                        child: const Text('Save Expense')),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
