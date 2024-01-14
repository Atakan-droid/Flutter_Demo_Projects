import 'package:flutter/material.dart';
import 'package:shopping_list/data/groseries_data.dart';
import 'package:shopping_list/model/grocery.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({super.key});

  final List<GroceryItem> data = groceryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery List"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              //leading: Image.asset(data[index].image),
              title: Text(""),
              subtitle: Text(data[index].category.title),
              trailing: Text(
                "\$${data[index].quantity}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
