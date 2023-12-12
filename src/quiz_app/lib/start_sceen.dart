import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 200,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 20),
          Text(
            'Quiz App',
            style: GoogleFonts.lato(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
