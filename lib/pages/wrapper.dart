import 'package:country_quiz/features/controllers/api_call.dart';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // late Future<List<CountryApiResponse>> countryData;

  @override
  void initState() {
    super.initState();
    fetchCountryData().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
