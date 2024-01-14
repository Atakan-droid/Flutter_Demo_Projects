import 'package:flutter/material.dart';
import 'package:shopping_list/screen/grocery_lscreen.dart';
import 'package:shopping_list/widgets/grocery_list.dart';
import 'package:shopping_list/widgets/new_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Shopping App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 42, 51, 59),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 50, 59, 60),
        ),
        home: GroceryList(),
        routes: {
          '/new-item': (context) => const NewItem(),
        });
  }
}
