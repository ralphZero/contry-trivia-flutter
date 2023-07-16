import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTimer extends StatelessWidget {
  final int timer;
  final double progressIndicatorValue;
  const QuestionTimer({
    super.key,
    required this.timer,
    required this.progressIndicatorValue,
  });

  @override
  Widget build(BuildContext context) {
    double customAppBarHeight = MediaQuery.of(context).size.height * 0.05;
    return SizedBox(
      height: customAppBarHeight,
      width: customAppBarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progressIndicatorValue,
            backgroundColor: leadearBoardBtnColor,
          ),
          Text(
            timer.toString(),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
