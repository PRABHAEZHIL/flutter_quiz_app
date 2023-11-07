import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/welcome_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  //  final void Function() reStartQuiz;
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'welcome_screen';
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = WelcomeScreen(switchScreen);
  //   super.initState();
  // }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'welcome_screen';
    });
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = WelcomeScreen(switchScreen);
    // print("activie Screen= $activeScreen");
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(restartQuiz, chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan, Color.fromARGB(255, 36, 8, 152)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
