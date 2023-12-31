import 'package:expense_tracker/utils/category_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../utils/category_type.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryType category;

  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate {
    return '${date.month}/${date.day}/${date.year}';
  }

  IconData get icon {
    return CategoryIcons.icons[category]!;
  }
}

class ExpenseBucket {
  final CategoryType category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  ExpenseBucket({required this.category, required this.expenses});

  double get totalExpenses {
    double sum = expenses.fold(
        0.0,
        (previousValue, element) =>
            previousValue + element.amount); //sum of all expenseses amount
    return sum;
  }
}
