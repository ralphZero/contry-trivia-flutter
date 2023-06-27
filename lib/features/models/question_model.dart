import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/question.dart';
import 'package:flutter/foundation.dart';

class QuestionModel extends ChangeNotifier {
  final List<Question> currentQuestion = [];

  void newQuestion() {
    // prepareTrivia().then((question) {
    //   currentQuestion.clear();
    //   currentQuestion.add(question);
    //   notifyListeners();
    // });
  }
}
