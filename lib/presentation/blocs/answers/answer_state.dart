part of 'answer_bloc.dart';

class AnswerState extends Equatable {
  final String text;
  final int questionId;
  final List<File> file;
  final Answer? answer;
  final String error;

  const AnswerState(
      { this.error = '', this.text = '', this.questionId = 0, this.file = const [], this.answer});

  @override
  List<Object?> get props => [text, questionId, file, error,answer];

  AnswerState copyWith({
    String? text,
    Answer? answer,
    int? questionId,
    List<File>? file,
    String? error,
  }) {
    return AnswerState(
      text: text ?? this.text,
      answer: answer ?? this.answer,
      questionId: questionId ?? this.questionId,
      file: file ?? this.file,
      error: error ?? this.error,
    );
  }
}
