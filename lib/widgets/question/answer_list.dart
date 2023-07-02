import 'package:country_quiz/features/models/question_item.dart';
import 'package:country_quiz/widgets/question/option.dart';
import 'package:flutter/material.dart';

class AnswerList extends StatefulWidget {
  final List<QuestionItem> answers;
  final int answerId;
  final void Function(int id) onOptionPressed;

  const AnswerList({
    super.key,
    required this.answers,
    required this.answerId,
    required this.onOptionPressed,
  });

  @override
  State<AnswerList> createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  int? selectedId;
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    handleOnOptionSelected(int selectedOptionId) {
      setState(() {
        selectedId = selectedOptionId;
        disabled = true;
      });
      widget.onOptionPressed(selectedOptionId);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.answers.map(
        (answer) {
          return selectedId != null && answer.id == selectedId
              ? Option(
                  onPressed: handleOnOptionSelected,
                  answerCopy: answer.name,
                  id: answer.id,
                  state: answer.id == widget.answerId
                      ? OptionState.success
                      : OptionState.failed,
                  disabled: disabled,
                )
              : Option(
                  onPressed: handleOnOptionSelected,
                  answerCopy: answer.name,
                  id: answer.id,
                  state: OptionState.normal,
                  disabled: disabled,
                );
        },
      ).toList(),
    );
  }
}
