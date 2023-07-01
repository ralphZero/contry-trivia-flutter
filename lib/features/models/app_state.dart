import 'dart:convert';
import 'dart:math';

import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:country_quiz/features/models/question.dart';
import 'package:country_quiz/features/models/question_item.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLoading;
  int started;
  List<CountryApiResponse>? data;
  Question? currQuestion;
  int score;

  AppState({
    this.started = 0,
    this.data,
    this.currQuestion,
    this.score = 0,
    this.isLoading = false,
  });

  initialData() async {
    isLoading = true;
    data = await fetchCountryData();
    isLoading = false;
    notifyListeners();
  }

  Question generateQuestion() {
    List<QuestionItem> selectedCountryData = [];

    for (var i = 0; i < 5; i++) {
      var randomIndex = Random().nextInt(data!.length - 5);
      var countryData = data!.elementAt(randomIndex);
      // if not capital, gengerate another index and get that data from list
      if (countryData.capital.isEmpty) {
        randomIndex = Random().nextInt(data!.length - 5);
        countryData = data!.elementAt(randomIndex);
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

    var questions = selectedCountryData.sublist(1, 2);
    selectedCountryData.shuffle();
    var answers = selectedCountryData.sublist(1, selectedCountryData.length);
    var hasFlag = Random().nextInt(10).floor() % 2 == 0 ? false : true;

    return Question(
      answers: answers,
      currAnswer: questions[0].id,
      hasFlag: hasFlag,
      question: questions[0],
    );
  }
}
