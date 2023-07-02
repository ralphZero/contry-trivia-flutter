import 'dart:convert';

import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {
  final void Function(int id) onPressed;
  final String answerCopy;
  final int id;
  final OptionState state;
  final bool disabled;

  const Option({
    super.key,
    required this.onPressed,
    required this.answerCopy,
    required this.id,
    this.state = OptionState.normal,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    var bgColor = state == OptionState.success
        ? optionBgSuccess
        : state == OptionState.failed
            ? optionBgFailed
            : optionBgColor;
    var textColor = state == OptionState.success
        ? optionTextSuccess
        : state == OptionState.failed
            ? optionTextFailed
            : optionTextColor;

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: !disabled ? () => onPressed(id) : null,
      child: Text(
        utf8.decode(utf8.encode(answerCopy)),
        style: GoogleFonts.inter(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

enum OptionState {
  normal,
  success,
  failed,
}
