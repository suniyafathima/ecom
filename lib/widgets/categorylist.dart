import 'package:ecom/widgets/categoryitem.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List items;
  const CategoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = items[index];
          return CategoryItem(label: category.categoryName ?? '');
        },
      ),
    );
  }
}