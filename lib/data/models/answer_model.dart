import 'dart:io';

class Answer {
  final int rating;
  final bool isBest;
  final int id;
  final String text;
  final int questionId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final File files;

  Answer({
    required this.rating,
    required this.isBest,
    required this.id,
    required this.text,
    required this.questionId,
    required this.updatedAt,
    required this.createdAt,
    required this.files,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      rating: json['rating'] as int,
      isBest: json['isBest'] as bool,
      id: json['id'] as int,
      text: json['text'] as String,
      questionId: json['questionId'] as int,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      files: json['files'] as File,
    );
  }
}
