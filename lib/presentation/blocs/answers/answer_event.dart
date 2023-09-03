part of 'answer_bloc.dart';

abstract class AnswerEvent extends Equatable {
  const AnswerEvent();

  @override
  List<Object?> get props => [];
}

class AddAnswerEvent extends AnswerEvent {
  final String text;
  final int questionId;
  final List<File> file;

  const AddAnswerEvent({
    required this.text,
    required this.questionId,
    this.file = const [],
  });

  @override
  List<Object> get props => [text, questionId, file];
}