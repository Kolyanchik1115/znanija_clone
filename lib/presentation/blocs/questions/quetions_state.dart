part of 'quetions_bloc.dart';

class QuestionState extends Equatable {
  final List<Question> questions;
  final int currentCategoryId;

  const QuestionState({
    this.currentCategoryId = 0,
    this.questions = const [],
  });

  QuestionState copyWith({
    List<Question>? questions,
    int? currentCategoryId,
  }) {
    return QuestionState(
      questions: questions ?? this.questions,
      currentCategoryId: currentCategoryId ?? this.currentCategoryId,
    );
  }

  @override
  List<Object> get props => [questions, currentCategoryId];
}
