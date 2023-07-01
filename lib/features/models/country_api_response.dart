class CountryApiResponse {
  final Map<String, dynamic> flags;
  final Map<String, dynamic> name;
  final List<dynamic> capital;

  CountryApiResponse({
    required this.capital,
    required this.name,
    required this.flags,
  });

  factory CountryApiResponse.fromJson(Map<String, dynamic> json) {
    return CountryApiResponse(
      capital: json['capital'],
      name: json['name'],
      flags: json['flags'],
    );
  }

  static List<CountryApiResponse> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((item) => CountryApiResponse.fromJson(item)).toList();
  }
}
