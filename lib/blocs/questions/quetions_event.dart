// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quetions_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestions extends QuestionEvent {
  final int categoryId, limit, page;
  final bool isAnswered;
  const FetchQuestions({
    required this.limit,
    required this.categoryId,
    required this.page,
    required this.isAnswered,
  });
  @override
  List<Object?> get props => [categoryId, limit, page, isAnswered];
}
