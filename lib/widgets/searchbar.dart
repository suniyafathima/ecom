import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            'Search',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xff272727),
            ),
          ),
        ],
      ),
    );
  }
}