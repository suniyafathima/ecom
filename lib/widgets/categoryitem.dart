import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;

  const CategoryItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFE6E6E6),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            label.isNotEmpty ? label[0] : '',
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
