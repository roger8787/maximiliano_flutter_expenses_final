import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_functionalities_flutter/providers/expenseProvider.dart';
import 'package:testing_functionalities_flutter/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.orange,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
