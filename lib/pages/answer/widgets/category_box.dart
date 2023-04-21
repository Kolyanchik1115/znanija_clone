import 'package:flutter/material.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/category_model.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                Config.imageUrl(category.image),
                height: 40,
              ),
              const SizedBox(width: 8),
              Text(
                category.name,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
