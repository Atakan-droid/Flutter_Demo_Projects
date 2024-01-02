import 'package:flutter/material.dart';
import 'package:todo_app/widgets/keys.dart';
import 'package:todo_app/widgets/ui_updated_demo.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MyApp'),
        ),
        body: const Center(
          child: Keys(),
        ),
      ),
    );
  }
}
