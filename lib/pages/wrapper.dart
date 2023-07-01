import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:country_quiz/pages/question.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late Future<List<CountryApiResponse>> countryData;

  @override
  void initState() {
    super.initState();
    countryData = fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryData,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          // has data
          return QuestionPage(
            data: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          // has error
          return const Placeholder();
        } else {
          // loading
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
