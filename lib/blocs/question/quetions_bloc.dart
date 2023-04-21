// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:znanija_clone/datasource/remote/question_remode_datasource.dart';
// import 'package:znanija_clone/models/question_model.dart';

// part 'quetions_event.dart';
// part 'quetions_state.dart';

// class QuetionsBloc extends Bloc<QuestionEvent, QuestionState> {
//   final _apiClient = QuetionClient();

//   QuetionsBloc() : super(const QuestionState()) {
//     on<FetchQuestions>((event, emit) async {
//     emit(state.copyWith(status: QuetionStatus.loading));

//       try {
//         final questions = await _apiClient.getQuestions(categoryId, isAnswered, limit, page);
//         yield QuestionListLoaded(questions: questions);
//       } catch (_) {
//         yield QuestionListError();
//       }
//     }
//     );
//   }
// }
