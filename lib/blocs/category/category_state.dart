part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final List<Categories> categories;
  final int currentCategoryIndex;

  const CategoryState({
    this.categories = const [],
    this.currentCategoryIndex = 0,
  });
  CategoryState copyWith({
    List<Categories>? categories,
    int? currentCategoryIndex,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      currentCategoryIndex: currentCategoryIndex ?? this.currentCategoryIndex,
    );
  }

  @override
  List<Object?> get props => [categories];
}
