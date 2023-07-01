import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:country_quiz/features/models/question.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLoading;
  int started;
  List<CountryApiResponse> data;
  Question? currQuestion;
  int score;

  AppState({
    this.started = 0,
    this.data = const [],
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
}
