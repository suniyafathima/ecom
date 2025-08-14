import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 201,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF087),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Maveli Image
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/mav.png',
              width: 148,
              height: 201,
              fit: BoxFit.cover,
            ),
          ),

          // Gift Image
          Positioned(
            left: 52,
            top: 102,
            child: Image.asset(
              'assets/images/gift.png',
              width: 123,
              height: 99.37,
              fit: BoxFit.cover,
            ),
          ),

          // Text
          Positioned(
            right: 16,
            top: 18,
            child: SizedBox(
              width: 194,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Onam Special\nExclusive Offer',
                    style: GoogleFonts.poppins(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      height: 1.2,
                      color: Color(0xff431F05),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Et provident eos est dolore. Eum libero eligendi molestias aut et',
                    style: GoogleFonts.poppins(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.3,
                      
                      color: Color(0xff431F05),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Carousel Dots
          Positioned(
            bottom: 16,
            right: 24,
            child: Row(
              children: List.generate(4, (index) {
                return Container(
                  width: index == 2 ? 14 : 5,
                  height: 5,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color:Color(0xff313131),
                      borderRadius: BorderRadius.circular(23),
                  ),
                );
              }),
            ),
          ),
         
        ],
      ),
    );
  }
}
