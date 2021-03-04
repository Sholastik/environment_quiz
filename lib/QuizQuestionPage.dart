import 'package:environment_quiz/App.dart';
import 'package:environment_quiz/QuizExplanationPage.dart';
import 'package:environment_quiz/QuizResult.dart';
import 'package:environment_quiz/QuizResultsPage.dart';
import "package:flutter/material.dart";
import 'package:hive/hive.dart';

import 'Quiz.dart';

class QuizQuestionPage extends StatefulWidget {
  static const routeName = "/quiz";

  @override
  _QuizQuestionPageState createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  var _questionNumber = 0;
  var _answers = <bool>[];

  void quizButtonOnClick(bool isCorrect) async {
    _answers.add(isCorrect);

    if (_questionNumber + 1 == Quiz.length) {
      var box = await Hive.openBox<QuizResult>(QuizApp.quizBoxName);
      box.add(QuizResult(DateTime.now(), _answers));

      Navigator.pop(context);
      Navigator.pushNamed(context, QuizResultsPage.routeName);
    }

    Navigator.pushNamed(
      context,
      QuizExplanationPage.routeName,
      arguments: QuizExplanationArguments(_questionNumber),
    );

    if (_questionNumber + 1 < Quiz.length) {
      setState(() {
        _questionNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var buttons = <QuizButton>[];
    var question = Quiz.getQuestion(_questionNumber);

    for (var i = 0; i < question.answers.length; i++) {
      buttons.add(QuizButton(question.answers[i], () {
        quizButtonOnClick(i == 0);
      }));
    }

    buttons.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: Text("Вопрос №${_questionNumber + 1}"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question.questionText,
              style: TextStyle(fontSize: 28.0),
            ),
            Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: buttons[0],
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: buttons[1],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buttons[2],
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: buttons[3],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuizButton extends ElevatedButton {
  QuizButton(String text, Function callback)
      : super(
          onPressed: () {
            callback();
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(text, style: TextStyle(fontSize: 20.0)),
          ),
        );
}
