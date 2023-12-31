import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  late List<Widget>? actions = [];

  CustomAlertDialog(
      {super.key, required this.title, required this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions != null && actions!.isEmpty
            ? [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ]
            : actions,
      ),
    );
  }
}
