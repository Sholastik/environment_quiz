import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'App.dart';
import 'QuizResult.dart';

void main() async {
  initializeDateFormatting();
  Intl.defaultLocale = "ru-RU";

  await Hive.initFlutter();
  Hive.registerAdapter(QuizResultAdapter());

  runApp(QuizApp());
}
