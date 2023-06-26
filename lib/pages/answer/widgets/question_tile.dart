import 'package:flutter/material.dart';
import 'package:znanija_clone/models/question_model.dart';

class QuestionTile extends StatelessWidget {
  final Question question;

  const QuestionTile({required this.question, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(question.text),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                side: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('Answer'),
            )
          ],
        ),
        trailing: question.isAnswered ? const Icon(Icons.check_circle) : null,
      ),
    );
  }
}
