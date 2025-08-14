import 'package:flutter/material.dart';

class IconButtonBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const IconButtonBox({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9C2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 24),
        onPressed: onPressed,
      ),
    );
  }
}