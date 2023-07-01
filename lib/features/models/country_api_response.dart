class CountryApiResponse {
  final String flags;
  final String name;
  final List<dynamic> capital;

  CountryApiResponse({
    required this.capital,
    required this.name,
    required this.flags,
  });

  factory CountryApiResponse.fromJson(Map<String, dynamic> json) {
    return CountryApiResponse(
      capital: json['capital'],
      name: json['name']['common'],
      flags: json['flags']['png'],
    );
  }

  static List<CountryApiResponse> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((item) => CountryApiResponse.fromJson(item)).toList();
  }
}
