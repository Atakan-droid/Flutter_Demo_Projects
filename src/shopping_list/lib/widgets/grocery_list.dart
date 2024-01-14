import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/grocery.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> data = [];
  String? _error;
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'shopping-app-max-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping_list.json');

    final response = await http.get(url);
    if (response.body == 'null') {
      return [];
    }
    if (response.statusCode == 200) {
      final List<GroceryItem> loadedItems = [];
      final Map<String, dynamic> listData = json.decode(response.body);
      for (final item in listData.entries) {
        final category = categories.entries.firstWhere(
            (element) => element.value.title == item.value['category']);
        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category.value,
          ),
        );
      }
      return loadedItems;
    }
    if (response.statusCode >= 400) {
      throw Exception('Failed to load items');
    }
    return [];
  }

  void _addItem() async {
    final item = await Navigator.pushNamed(context, '/new-item');
    if (item != null) {
      setState(() {
        data.add(item as GroceryItem);
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    final index = data.indexOf(item);
    setState(() {
      data.remove(item);
    });
    final url = Uri.https(
        'shopping-app-max-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping_list/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      if (!context.mounted) {
        return;
      }
      setState(() {
        data.insert(index, item);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete item'),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery List"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text("No Items Found"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey(snapshot.data![index].id),
                onDismissed: (direction) {
                  _removeItem(snapshot.data![index]);
                },
                child: ListTile(
                  title: Text(snapshot.data![index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: snapshot.data![index].category.color,
                  ),
                  subtitle: Text(snapshot.data![index].category.title),
                  trailing: Text(
                    "\$${snapshot.data![index].quantity}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
