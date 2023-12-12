import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_sceen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      _activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = "start-screen";
      _selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (_activeScreen == "question-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (_activeScreen == "results-screen") {
      if (_selectedAnswers.isEmpty) return StartScreen(switchScreen);
      screenWidget = ResultsScreen(
          chosenAnswers: _selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
