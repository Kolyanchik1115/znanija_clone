class QuestionList {
  final int count;
  final List<Question> rows;

  QuestionList({
    required this.count,
    required this.rows,
  });

  factory QuestionList.fromJson(Map<String, dynamic> json) {
    var questionList = json['rows'] as List;
    List<Question> questions =
        questionList.map((question) => Question.fromJson(question)).toList();

    return QuestionList(
      count: json['count'],
      rows: questions,
    );
  }
}
class Question {
  final int id;
  final String text;
  final bool isAnswered;
  final String createdAt;
  final String updatedAt;
  final int categoryId;
  final int userId;

  Question({
    required this.id,
    required this.text,
    required this.isAnswered,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.userId,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      isAnswered: json['isAnswered'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      categoryId: json['categoryId'],
      userId: json['userId'],
    );
  }
}
