import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/utils/category_type.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      category: CategoryType.bills,
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.food,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.other,
      title: 'Flutter',
      amount: 1,
      date: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'T-Shirt',
      amount: 19.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'Jeans',
      amount: 39.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'Sweater',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'Sweater',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'Sweater',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Expense(
      category: CategoryType.shopping,
      title: 'Sweater',
      amount: 29.99,
      date: DateTime.now(),
    ),
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, // widget metadata and contains other widgets context
      builder: (context) => NewExpense(
        onAddExpense: _addNewExpense,
      ),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    //find the index of the expense for add again
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text("Expense Deleted."),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void _editExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No Expenses Added Yet!"),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: expenses,
        onDelete: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expenses: expenses,
                ),
                const Text("The Chart"),
                mainContent,
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Chart(
                    expenses: expenses,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
