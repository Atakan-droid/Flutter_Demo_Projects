import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onDelete;
  const ExpenseList({Key? key, required this.expenses, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                  horizontal:
                      Theme.of(context).cardTheme.margin?.horizontal ?? 16,
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  onDelete(expense);
                }
                if (direction == DismissDirection.startToEnd) {
                  return;
                }
              },
              child: ExpenseItem(expense: expense));
        },
      ),
    );
  }
}
