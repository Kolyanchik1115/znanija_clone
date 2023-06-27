part of 'quetions_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestions extends QuestionEvent {
  final int? categoryId;
  final bool? isAnswered;
  const FetchQuestions({
    this.isAnswered,
    this.categoryId,
  });
  @override
  List<Object?> get props => [categoryId, isAnswered];
}
