class Question {
  String answer;
  String question;
  List<String> choices;
  bool hasFlag;

  Question({
    required this.answer,
    required this.choices,
    required this.hasFlag,
    required this.question,
  });
}
