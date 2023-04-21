import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/datasource/remote/question_remode_datasource.dart';
import 'package:znanija_clone/models/question_model.dart';

part 'quetions_event.dart';
part 'quetions_state.dart';

class QuestionsBloc extends Bloc<QuestionEvent, QuestionState> {
  final _apiClient = QuetionClient();

  QuestionsBloc() : super(const QuestionState()) {
    on<FetchQuestions>((event, emit) async {
      try {
        final questionList = await _apiClient.getQuestions(
            event.categoryId, event.isAnswered, event.limit, event.page);

        emit(state.copyWith(
          currentCategoryId: event.categoryId,
          questions: questionList.rows,
        ));
      } catch (_) {}
    });
  }
}
