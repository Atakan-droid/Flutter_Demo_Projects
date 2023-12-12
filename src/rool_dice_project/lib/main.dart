import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //body: GradientContainer.purple(),
        body: GradientContainer(
          colors: const [Colors.purple, Colors.white],
        ),
      ),
    );
  }
}
