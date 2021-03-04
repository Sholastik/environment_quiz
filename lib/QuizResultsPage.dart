import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'App.dart';
import 'QuizResult.dart';

class QuizResultsPage extends StatefulWidget {
  static const routeName = "/results";

  @override
  _QuizResultsPageState createState() => _QuizResultsPageState();
}

class _QuizResultsPageState extends State<QuizResultsPage> {
  late Future<Box<QuizResult>> _quizBox;

  @override
  void initState() {
    super.initState();
    _quizBox = Hive.openBox<QuizResult>(QuizApp.quizBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Результаты"),
      ),
      body: FutureBuilder<Box<QuizResult>>(
        future: _quizBox,
        builder:
            (BuildContext context, AsyncSnapshot<Box<QuizResult>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                  children: snapshot.data!.values
                      .map((e) => QuizResultListItem(e))
                      .toList()
                      .reversed
                      .toList()),
            );
          }
        },
      ),
    );
  }
}

class QuizResultListItem extends StatelessWidget {
  final QuizResult _quizResult;

  QuizResultListItem(this._quizResult);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  DateFormat("d MMMM yyyy в H:mm").format(_quizResult.dateTime),
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _quizResult.answers
                      .map((e) => Icon(
                            e ? Icons.check : Icons.close,
                            color: e ? Colors.green : Colors.red,
                          ))
                      .toList(),
                ),
              ],
            ),
            Text(
              "${(_quizResult.answers.where((element) => element).length * 100.0 / _quizResult.answers.length).toStringAsFixed(0)}%",
              style: TextStyle(fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
