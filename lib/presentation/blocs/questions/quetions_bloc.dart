import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/data/datasource/remote/question_remode_datasource.dart';
import 'package:znanija_clone/data/models/question_model.dart';

part 'quetions_event.dart';
part 'quetions_state.dart';

class QuestionsBloc extends Bloc<QuestionEvent, QuestionState> {
  final _apiClient = QuestionClient();
  final limit = 20; //temporarily use this constants
  var page = 1; //temporarily use this constants

  QuestionsBloc() : super(const QuestionState()) {
    on<FetchQuestions>((event, emit) async {
      try {
        final questionList = await _apiClient.getQuestions(
            event.categoryId, event.isAnswered, limit, page);
        emit(state.copyWith(
          currentCategoryId: event.categoryId,
          questions: questionList.rows,
        ));
      } catch (_) {}
    });
  }
}
