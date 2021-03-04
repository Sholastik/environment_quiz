import 'package:environment_quiz/QuizExplanationPage.dart';
import 'package:environment_quiz/QuizHomePage.dart';
import 'package:environment_quiz/QuizQuestionPage.dart';
import 'package:environment_quiz/QuizResult.dart';
import 'package:environment_quiz/QuizResultDetailsPage.dart';
import 'package:environment_quiz/QuizResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class QuizApp extends StatefulWidget {
  static const quizBoxName = 'quizResultBox';

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Box<QuizResult> _quizBox;

  @override
  void initState() {
    super.initState();
    openBoxes();
  }

  void openBoxes() async {
    _quizBox = await Hive.openBox<QuizResult>(QuizApp.quizBoxName);
  }

  void closeBoxes() async {
    await _quizBox.compact();
    await _quizBox.close();

    await Hive.close();
  }

  @override
  void dispose() {
    super.dispose();
    closeBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ресурсы и охрана окружающей среды',
      initialRoute: QuizHomePage.routeName,
      routes: {
        QuizHomePage.routeName: (context) => QuizHomePage(),
        QuizQuestionPage.routeName: (context) => QuizQuestionPage(),
        QuizExplanationPage.routeName: (context) => QuizExplanationPage(),
        QuizResultsPage.routeName: (context) => QuizResultsPage(),
        QuizResultDetailsPage.routeName: (context) => QuizResultDetailsPage(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
