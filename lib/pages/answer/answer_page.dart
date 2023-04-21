import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/category/category_bloc.dart';
import 'package:znanija_clone/pages/answer/widgets/category_box.dart';

class AnswerPage extends StatelessWidget {
  static const routeName = '/answer_page';
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final categories = state.categories;
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryBox(category: category);
            },
          );
        },
      ),
    );
  }
}
