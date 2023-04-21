part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final List<Categories> categories;

  const CategoryState({
    this.categories = const [],
  });

  CategoryState copyWith({
    List<Categories>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [categories];
}
