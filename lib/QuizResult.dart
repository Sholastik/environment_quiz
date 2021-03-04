import 'package:hive/hive.dart';

part 'QuizResult.g.dart';

@HiveType(typeId: 0)
class QuizResult extends HiveObject {
  QuizResult(this.dateTime, this.answers);

  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  List<bool> answers;
}
