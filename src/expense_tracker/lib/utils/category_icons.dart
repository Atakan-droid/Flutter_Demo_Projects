import 'package:expense_tracker/utils/category_type.dart';
import 'package:flutter/material.dart';

class CategoryIcons {
  static const bills = Icons.receipt_long;
  static const food = (Icons.fastfood);
  static const shopping = Icons.shopping_cart;
  static const other = Icons.category;
  static const all = [
    bills,
    food,
    shopping,
    other,
  ];

  static const icons = {
    CategoryType.bills: bills,
    CategoryType.food: food,
    CategoryType.shopping: shopping,
    CategoryType.other: other,
  };
}
