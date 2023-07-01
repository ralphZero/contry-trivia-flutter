import 'package:country_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../features/models/app_state.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();
  }

  void handleOnClose() {
    print('tap');
    return;
  }

  void printToConsole(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    var customAppBarHeight = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: pageGradient,
          ),
          child: Column(
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
                    Text(
                      'timer',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => printToConsole(context),
                    child: const Text('print'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
