import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:znanija_clone/data/datasource/remote/answer_remote_database.dart';
import 'package:znanija_clone/data/models/answer_model.dart';

part 'answer_event.dart';
part 'answer_state.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  AnswerBloc() : super(const AnswerState()) {
    on<AddAnswerEvent>((event, emit) async {
      try {
        final answer = await AnswerClient().addAnswer(event.text, event.questionId, event.file);
        emit(state.copyWith(answer: answer, error: ''));
      } catch (e) {
        emit(state.copyWith(error: 'Произошла ошибка при отправке ответа'));
      }
    });
  }
}
