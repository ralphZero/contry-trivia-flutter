import 'package:country_quiz/features/models/app_state.dart';
import 'package:country_quiz/pages/game_over.dart';
import 'package:country_quiz/pages/question.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    appState.initialData();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    if (!appState.getLoadingState && !appState.gameOver) {
      // has data
      return const QuestionPage();
    } else if (appState.getGameStatus) {
      return const GameOver();
    } else {
      // loading
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(gradient: pageGradient),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
