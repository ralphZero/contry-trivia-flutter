import 'package:country_quiz/mocks/home_cms.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallToActions extends StatelessWidget {
  final HomeCMS cms;
  final Function handlePlay;
  final Function handleOpenLeaderboard;

  const CallToActions({
    super.key,
    required this.cms,
    required this.handlePlay,
    required this.handleOpenLeaderboard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: tertiary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            fixedSize: const Size.fromWidth(200.0),
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: () => handlePlay(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              cms.playCta,
              style: const TextStyle(
                color: accentText,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: leadearBoardBtnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            fixedSize: const Size.fromWidth(200.0),
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: () => handleOpenLeaderboard(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(cms.leaderboardCta),
          ),
        ),
      ],
    );
  }
}
