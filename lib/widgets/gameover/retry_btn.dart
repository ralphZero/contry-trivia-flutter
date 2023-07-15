import 'package:country_quiz/mocks/game_over_cms.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RetryButton extends StatelessWidget {
  final GameOverCMS? cms;
  final Function handleClick;
  const RetryButton({super.key, this.cms, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
      onPressed: () => handleClick(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          cms!.retryBtnCopy,
          style: const TextStyle(
            color: accentText,
          ),
        ),
      ),
    );
  }
}
