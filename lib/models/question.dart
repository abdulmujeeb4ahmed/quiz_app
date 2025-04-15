import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final unescape = HtmlUnescape();

    List<String> options = List<String>.from(json['incorrect_answers']);
    options.add(json['correct_answer']);
    options = options.map((e) => unescape.convert(e)).toList();
    options.shuffle();

    return Question(
      question: unescape.convert(json['question']),
      options: options,
      correctAnswer: unescape.convert(json['correct_answer']),
    );
  }
}
