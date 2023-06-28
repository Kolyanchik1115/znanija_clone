import 'package:flutter/material.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/common/theme/data.dart';
import 'package:znanija_clone/models/category_model.dart';
import 'package:znanija_clone/models/question_model.dart';

class QuestionTile extends StatelessWidget {
  final Question question;
  final Categories category;

  const QuestionTile({
    Key? key,
    required this.question,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  Config.imageUrl(category.image),
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  category.name,
                  style: const TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Text(
                  formatServerTime(category.createdAt),
                  style: const TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(question.text, overflow: TextOverflow.ellipsis, maxLines: 2),
          ],
        ),
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
