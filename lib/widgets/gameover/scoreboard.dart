import 'package:country_quiz/mocks/game_over_cms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreBoard extends StatelessWidget {
  final int score;
  final GameOverCMS? cms;
  const ScoreBoard({super.key, required this.score, this.cms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cms!.scoreTitle,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          score.toString(),
          style: GoogleFonts.inter(
            fontSize: 128,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
