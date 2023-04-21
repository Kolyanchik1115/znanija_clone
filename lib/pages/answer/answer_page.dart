import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/category/category_bloc.dart';
import 'package:znanija_clone/blocs/questions/quetions_bloc.dart';
import 'package:znanija_clone/pages/answer/widgets/category_box.dart';
import 'package:znanija_clone/pages/answer/widgets/question_tile.dart';

class AnswerPage extends StatelessWidget {
  static const routeName = '/answer_page';

  const AnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                final categories = state.categories;
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return BlocBuilder<QuestionsBloc, QuestionState>(
                      builder: (context, state) {
                        return CategoryBox(
                          category: category,
                          isSelected: category.id == state.currentCategoryId,
                          onPressed: () {
                            context.read<QuestionsBloc>().add(FetchQuestions(
                                limit: 20,
                                categoryId: category.id,
                                page: 1,
                                isAnswered: false));
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: BlocBuilder<QuestionsBloc, QuestionState>(
              builder: (context, state) {
                final questions = state.questions;
                if (questions.isEmpty) {
                  return const Center(
                    child: Text('No questions found'),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return QuestionTile(
                      question: question,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
