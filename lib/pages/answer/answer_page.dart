import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/category/category_bloc.dart';
import 'package:znanija_clone/blocs/questions/quetions_bloc.dart';
import 'package:znanija_clone/pages/answer/widgets/question_tile.dart';

class AnswerPage extends StatelessWidget {
  static const routeName = '/answerpage';
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
            flex: 6,
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, categoryState) {
                return BlocBuilder<QuestionsBloc, QuestionState>(
                  builder: (context, questionState) {
                    final questions = questionState.questions;
                    final categories = categoryState.categories;
                    if (questions.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.cyan),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];
                        return QuestionTile(
                          question: question,
                          category: categories.firstWhere(
                            (element) => element.id == question.categoryId,
                          ),
                        );
                      },
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
