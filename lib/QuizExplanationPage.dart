import "package:flutter/material.dart";

import 'Quiz.dart';

class QuizExplanationArguments {
  final int number;

  QuizExplanationArguments(this.number);
}

class QuizExplanationPage extends StatelessWidget {
  static const routeName = "/quiz/explanation";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as QuizExplanationArguments;
    final question = Quiz.getQuestion(args.number);

    return Scaffold(
      appBar: AppBar(
        title: Text("Пояснение к вопросу №${args.number + 1}"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    question.questionText,
                    style: TextStyle(fontSize: 28.0),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    question.explanation,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Далее",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
