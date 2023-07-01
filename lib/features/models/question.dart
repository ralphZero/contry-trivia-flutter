import 'package:country_quiz/features/models/question_item.dart';

class Question {
  final QuestionItem question;
  final bool hasFlag;
  final List<QuestionItem> answers;
  final int currAnswer;

  Question({
    required this.answers,
    required this.currAnswer,
    required this.hasFlag,
    required this.question,
  });
}
