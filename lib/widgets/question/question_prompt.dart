import 'package:country_quiz/mocks/question_cms.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPrompt extends StatelessWidget {
  final String capital;
  final bool hasFlag;
  final QuestionPageCMS? cms;

  const QuestionPrompt({
    super.key,
    required this.capital,
    required this.hasFlag,
    this.cms,
  });

  @override
  Widget build(BuildContext context) {
    final promptStyle = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      color: primary,
    );

    final capitalStyle = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      color: secondary,
      decoration: TextDecoration.underline,
    );

    if (hasFlag) {
      return Text(
        cms!.questionSection.withFlag.title,
        style: promptStyle,
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 52.0),
          Wrap(
            children: [
              Text(
                cms!.questionSection.withoutFlag.title,
                style: promptStyle,
              ),
              const SizedBox(width: 5.0),
              Text(
                capital,
                style: capitalStyle,
              ),
              const SizedBox(width: 5.0),
              Text(
                '?',
                style: promptStyle,
              ),
            ],
          ),
        ],
      );
    }
  }
}
