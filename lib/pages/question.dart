import 'package:country_quiz/mocks/question_cms.dart';
import 'package:country_quiz/pages/home.dart';
import 'package:country_quiz/utils/constants.dart';
import 'package:country_quiz/widgets/question/question_flag.dart';
import 'package:country_quiz/widgets/question/question_prompt.dart';
import 'package:country_quiz/widgets/question/score_box.dart';
import 'package:country_quiz/widgets/question/timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../features/models/app_state.dart';
import '../widgets/question/answer_list.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var cms = QuestionPageCMS();
  bool showNextButton = false;
  int selectedAnswerId = -1;
  bool disabledOptions = false;

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    appState.startTimer();
  }

  void handleOnClose() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const Home(),
      ),
    );
  }

  void handleNext(BuildContext context) {
    // generate next question
    var appState = context.read<AppState>();

    setState(() {
      disabledOptions = false;
      selectedAnswerId = -1;
      showNextButton = false;
    });

    appState.generateQuestion();
    appState.resetTimer();
  }

  void handleOnOptionPressed(int selectedId) {
    var appState = context.read<AppState>();
    appState.stopTimer();

    var currentAnswerId = appState.currQuestion!.currAnswer;

    setState(() {
      disabledOptions = true;
      selectedAnswerId = selectedId;
    });

    // if correct question
    if (currentAnswerId == selectedId) {
      appState.updateScore();
      setState(() {
        showNextButton = true;
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        appState.setGameOver();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double customAppBarHeight = MediaQuery.of(context).size.height * 0.05;
    double customScoreHeight = MediaQuery.of(context).size.height * 0.2;
    double dynamicMargin = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: pageGradient,
          ),
          child: Consumer<AppState>(
            builder: (ctx, state, child) {
              bool hasFlag = state.getCurrentQuestion!.hasFlag;
              var name = state.getCurrentQuestion!.question.name;
              var flagUrl = state.getCurrentQuestion!.question.flag;
              var answers = state.getCurrentQuestion!.answers;
              var answerId = state.getCurrentQuestion!.currAnswer;
              var score = state.getScore;
              var timer = state.getTimerValue;
              var progressIndicatorValue = timer / 15;

              if (progressIndicatorValue == 0) {
                state.timer.cancel();
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    state.setGameOver();
                  },
                );
              }

              return Column(
                children: [
                  SizedBox(
                    height: customAppBarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: handleOnClose,
                          color: Colors.white,
                        ),
                        QuestionTimer(
                          timer: timer,
                          progressIndicatorValue: progressIndicatorValue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: customScoreHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScoreBox(
                          currScore: score,
                          cms: cms,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width - dynamicMargin,
                      margin: EdgeInsets.fromLTRB(
                        dynamicMargin,
                        dynamicMargin,
                        dynamicMargin,
                        dynamicMargin * 2,
                      ),
                      padding: const EdgeInsets.all(18.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              QuestionFlag(
                                flagUrl: flagUrl,
                                hasFlag: hasFlag,
                              ),
                              QuestionPrompt(
                                name: name,
                                hasFlag: hasFlag,
                                cms: cms,
                              ),
                            ],
                          ),
                          AnswerList(
                            hasFlag: hasFlag,
                            answers: answers,
                            answerId: answerId,
                            onOptionPressed: handleOnOptionPressed,
                            disabled: disabledOptions,
                            selectedId: selectedAnswerId,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showNextButton
                                  ? ElevatedButton(
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
                                      onPressed: () => handleNext(context),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          cms.cta.title,
                                          style: const TextStyle(
                                            color: accentText,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 52.0,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
