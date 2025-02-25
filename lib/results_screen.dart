import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.reStartQuiz,
      {super.key, required this.chosenAnswers});
  final void Function() reStartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summayData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summayData.where((data) {
      return (data['user_answer'] == data['correct_answer']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  'Your answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 202, 182, 7),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 40),
            QuestionsSummary(summayData),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: reStartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
