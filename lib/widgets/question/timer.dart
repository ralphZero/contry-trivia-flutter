import 'package:country_quiz/features/models/app_state.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionTimer extends StatefulWidget {
  final int timer;

  const QuestionTimer({
    super.key,
    required this.timer,
  });

  @override
  State<QuestionTimer> createState() => _QuestionTimerState();
}

class _QuestionTimerState extends State<QuestionTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late int _durationInSeconds;

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    _durationInSeconds = appState.initalGameTimerValue;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _durationInSeconds),
    );
    _animationController.reverse(
        from: appState.initalGameTimerValue.toDouble());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double customAppBarHeight = MediaQuery.of(context).size.height * 0.05;

    // setState(() {
    //   _durationInSeconds = widget.progressIndicatorValue.toInt();
    //   _animationController.duration = Duration(seconds: _durationInSeconds);
    //   _animationController.reverse(from: widget.progressIndicatorValue);
    // });

    return Consumer<AppState>(
      builder: (ctx, state, _) {
        var timerStatus = state.getCountdownStatus;
        if (timerStatus == TimerStatus.stopped) {
          _animationController.stop();
        } else if (timerStatus == TimerStatus.reset) {
          _animationController.reset();
        }
        return SizedBox(
          height: customAppBarHeight,
          width: customAppBarHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CircularProgressIndicator(
                    value: _animationController.value,
                    backgroundColor: leadearBoardBtnColor,
                  );
                },
              ),
              Text(
                widget.timer.toString(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
