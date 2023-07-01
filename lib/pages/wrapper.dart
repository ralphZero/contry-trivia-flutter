import 'package:country_quiz/features/models/app_state.dart';
import 'package:country_quiz/pages/question.dart';
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
    if (!appState.getLoadingState) {
      // has data
      return const QuestionPage();
    } else {
      // loading
      return const CircularProgressIndicator();
    }
  }
}
