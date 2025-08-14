import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionHeader({super.key, required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xff272727),
          ),
        ),
        Text(
          actionText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xff272727),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}