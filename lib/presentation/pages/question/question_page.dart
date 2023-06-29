import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/presentation/blocs/category/category_bloc.dart';
import 'package:znanija_clone/presentation/blocs/questions/quetions_bloc.dart';
import 'package:znanija_clone/presentation/pages/question/widgets/question_tile.dart';

class QuestionPage extends StatelessWidget {
  static const routeName = '/questionpage';
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              child: const Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            const SizedBox(width: 10),
            const Text(
              'Sort questions',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: false,
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
