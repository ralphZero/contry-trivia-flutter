import 'dart:async';
import 'dart:math';
import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:country_quiz/features/models/question.dart';
import 'package:country_quiz/features/models/question_item.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLoading = false;
  int started = 0;
  List<CountryApiResponse> data = [];
  Question? currQuestion;
  int score = 0;
  int gameTimer = 15;
  late Timer timer;
  bool gameOver = false;

  // getters
  bool get getLoadingState => isLoading;
  int get getScore => score;
  int get getQuestionCount => started;
  Question? get getCurrentQuestion => currQuestion;
  int get getTimerValue => gameTimer;
  bool get gameStatus => gameOver;

  void initialData() async {
    isLoading = true;
    data = await fetchCountryData();
    isLoading = false;
    gameOver = false;
    resetCounters();
    generateQuestion();
  }

  void generateQuestion() {
    List<QuestionItem> selectedCountryData = [];

    for (var i = 0; i < 5; i++) {
      var randomIndex = Random().nextInt(data.length - 5);
      var countryData = data.elementAt(randomIndex);
      // if not capital, gengerate another index and get that data from list
      if (countryData.capital.isEmpty) {
        randomIndex = Random().nextInt(data.length - 5);
        countryData = data.elementAt(randomIndex);
      }
      selectedCountryData.add(
        QuestionItem(
          id: i,
          name: countryData.name,
          capital: countryData.capital[0],
          flag: countryData.flags,
        ),
      );
    }

    var questions = selectedCountryData.sublist(0, 1);
    selectedCountryData.shuffle();
    var answers =
        selectedCountryData.sublist(0, selectedCountryData.length - 1);
    if (answers.indexWhere((answer) => answer.id == questions[0].id) == -1) {
      answers.removeAt(0);
      answers.add(questions[0]);
      answers.shuffle();
    }
    var hasFlag = Random().nextInt(10).floor() % 2 == 0 ? false : true;

    currQuestion = Question(
      answers: answers,
      currAnswer: questions[0].id,
      hasFlag: hasFlag,
      question: questions[0],
    );

    notifyListeners();
  }

  void setGameOver() {
    gameOver = true;
    notifyListeners();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (gameTimer == 0) {
          timer.cancel();
        } else {
          gameTimer--;
        }
        notifyListeners();
      },
    );
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
      notifyListeners();
    }
  }

  void resetTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    gameTimer = 15;
    startTimer();
  }

  void updateGameTimer(int value) {
    gameTimer += value;
    notifyListeners();
  }

  void resetCounters() {
    score = 0;
    started = 0;
    gameTimer = 15;
  }

  void updateScore() {
    score++;
    started++;
    notifyListeners();
  }
}
