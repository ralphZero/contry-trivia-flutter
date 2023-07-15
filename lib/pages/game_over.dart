import 'package:country_quiz/features/models/app_state.dart';
import 'package:country_quiz/mocks/game_over_cms.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:country_quiz/widgets/gameover/home_btn.dart';
import 'package:country_quiz/widgets/gameover/retry_btn.dart';
import 'package:country_quiz/widgets/gameover/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  final cms = GameOverCMS();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenPaddingBottom = MediaQuery.of(context).size.height * 0.08;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            bottom: screenPaddingBottom,
          ),
          width: screenWidth,
          decoration: const BoxDecoration(
            gradient: pageGradient,
          ),
          child: Consumer<AppState>(builder: (ctx, state, child) {
            var score = state.getScore;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                ScoreBoard(
                  score: score,
                  cms: cms,
                ),
                Column(
                  children: [
                    RetryButton(
                      cms: cms,
                      handleClick: () {},
                    ),
                    const SizedBox(height: 16.0),
                    GoToHomeButton(
                      cms: cms,
                      handleClick: () {},
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
