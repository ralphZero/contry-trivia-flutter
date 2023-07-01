import 'package:country_quiz/mocks/question_cms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreBox extends StatelessWidget {
  final QuestionPageCMS? cms;
  final int currScore;

  const ScoreBox({
    super.key,
    this.cms,
    required this.currScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cms?.scoreBox.title ?? '',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        Text(
          currScore.toString(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36.0,
          ),
        ),
      ],
    );
  }
}
