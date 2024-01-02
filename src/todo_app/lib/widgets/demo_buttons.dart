import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() => _DemoButtonsState();
}

class _DemoButtonsState extends State<DemoButtons> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('demo buttons build() called');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24.0,
          child: Checkbox(
            value: _isUnderstood,
            onChanged: (value) {
              setState(() {
                _isUnderstood = value!;
              });
            },
          ),
        ),
        const Text('Yes'),
        const SizedBox(width: 8.0),
        SizedBox(
          width: 24.0,
          child: Checkbox(
            value: !_isUnderstood,
            onChanged: (value) {
              setState(() {
                _isUnderstood = value!;
              });
            },
          ),
        ),
        const Text('No'),
      ],
    );
  }
}
