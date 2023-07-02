import 'package:country_quiz/features/models/question_item.dart';
import 'package:flutter/material.dart';

class AnswerList extends StatelessWidget {
  final List<QuestionItem> answers;
  final int answerId;
  const AnswerList({super.key, required this.answers, required this.answerId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers.map((answer) => Text(answer.name)).toList(),
    );
  }
}
