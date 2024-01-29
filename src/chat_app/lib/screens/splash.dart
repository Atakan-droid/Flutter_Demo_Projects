import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat App Loading...'),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
