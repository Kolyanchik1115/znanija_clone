import 'package:flutter/material.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/category_model.dart';

class CategoryBox extends StatelessWidget {
  final Categories category;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryBox({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.cyan : const Color(0xFFEEF1F8),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              children: [
                Image.network(
                  Config.imageUrl(category.image),
                  height: 40,
                  width: 120,
                ),
                const SizedBox(height: 10),
                Text(
                  category.name,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
