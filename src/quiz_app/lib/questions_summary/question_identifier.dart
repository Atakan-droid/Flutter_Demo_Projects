import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrect ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
