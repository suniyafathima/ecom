import 'package:ecom/widgets/iconbuttonbox.dart';
import 'package:ecom/widgets/notificationicon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Shammas',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color(0xff1E1E1E),
              ),
            ),
            Text(
              "Let's start shopping",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1,
                color: const Color(0xff1E1E1E),
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButtonBox(icon: Icons.favorite_border, onPressed: () {}),
            const SizedBox(width: 16),
            NotificationIcon(),
          ],
        ),
      ],
    );
  }
}