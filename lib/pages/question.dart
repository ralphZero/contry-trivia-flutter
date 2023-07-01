import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final List<CountryApiResponse> data;
  const QuestionPage({super.key, required this.data});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
