import 'package:environment_quiz/QuizQuestionPage.dart';
import 'package:environment_quiz/QuizResultsPage.dart';
import "package:flutter/material.dart";

class QuizHomePage extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ресурсы и охрана окружающей среды"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Привет!",
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Пройти тест",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, QuizQuestionPage.routeName);
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Мои результаты",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, QuizResultsPage.routeName);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text("Разработано студией Вячеслава Иванова"),
            ),
          ),
        ],
      ),
    );
  }
}
