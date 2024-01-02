import 'package:flutter/material.dart';
import 'package:todo_app/widgets/demo_buttons.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  @override
  State<UIUpdatesDemo> createState() {
    print('createState() called');
    return _UIUpdatesDemoState();
  }
}

class _UIUpdatesDemoState extends State<UIUpdatesDemo> {
  @override
  Widget build(BuildContext context) {
    print('build() called');
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Do you understand Flutter?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          DemoButtons(),
        ],
      ),
    );
  }
}
