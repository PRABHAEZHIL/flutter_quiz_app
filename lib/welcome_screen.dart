import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assest/pics/quiz-logo.png',
              width: 300, color: const Color.fromARGB(105, 255, 255, 255)),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assest/pics/quiz-logo.png', width: 300),
          // ),
          const SizedBox(height: 40),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
