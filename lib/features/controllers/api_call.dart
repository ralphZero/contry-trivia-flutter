import 'dart:convert';
import 'package:country_quiz/features/models/country_api_response.dart';
import 'package:country_quiz/features/models/question.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<CountryApiResponse>> fetchCountryData() async {
  final cache = await SharedPreferences.getInstance();
  final cachedData = cache.getString('countries');

  if (cachedData != null && cachedData.isNotEmpty) {
    final List<dynamic> jsonArray = jsonDecode(cachedData);
    return CountryApiResponse.fromJsonArray(jsonArray);
  } else {
    const urlString =
        'https://restcountries.com/v3.1/all?fields=name,flags,capital';
    var url = Uri.parse(urlString);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      cache.setString('countries', response.body);
      final List<dynamic> jsonArray = jsonDecode(response.body);
      return CountryApiResponse.fromJsonArray(jsonArray);
    } else {
      throw Exception('Failed to fetch country data');
    }
  }
}
