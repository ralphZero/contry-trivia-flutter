import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  final void Function() onPressed;
  final String answerCopy;
  final int id;
  final int answerId;

  const Option({
    super.key,
    required this.onPressed,
    required this.answerCopy,
    required this.answerId,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        answerCopy,
        style: GoogleFonts.inter(color: primary),
      ),
    );
  }
}
