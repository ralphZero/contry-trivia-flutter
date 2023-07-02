import 'package:country_quiz/features/models/question_item.dart';
import 'package:country_quiz/widgets/question/option.dart';
import 'package:flutter/material.dart';

class AnswerList extends StatelessWidget {
  final int selectedId;
  final bool disabled;
  final bool hasFlag;
  final List<QuestionItem> answers;
  final int answerId;
  final void Function(int id) onOptionPressed;

  const AnswerList({
    super.key,
    required this.answers,
    required this.answerId,
    required this.onOptionPressed,
    this.disabled = false,
    this.selectedId = -1,
    required this.hasFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: answers.map(
        (answer) {
          return selectedId != -1 && answer.id == selectedId
              ? Option(
                  onPressed: onOptionPressed,
                  answerCopy: hasFlag ? answer.name : answer.capital,
                  id: answer.id,
                  state: answer.id == answerId
                      ? OptionState.success
                      : OptionState.failed,
                  disabled: disabled,
                )
              : Option(
                  onPressed: onOptionPressed,
                  answerCopy: hasFlag ? answer.name : answer.capital,
                  id: answer.id,
                  state: OptionState.normal,
                  disabled: disabled,
                );
        },
      ).toList(),
    );
  }
}
