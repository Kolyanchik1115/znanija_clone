import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/datasource/remote/question_remode_datasource.dart';
import 'package:znanija_clone/models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final _apiClient = QuestionClient();

  CategoryBloc() : super(const CategoryState()) {
    on<FetchCategories>((event, emit) async {
      try {
        final categories = await _apiClient.getCategories();
        emit(state.copyWith(categories: categories));
      } catch (_) {}
    });
    
  }
}
