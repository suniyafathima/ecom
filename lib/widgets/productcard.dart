import 'package:ecom/widgets/productitem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final ProductItem item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.imageAsset,
            height: 125,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                height: 125,
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey, size: 48),
                ),
              );
            },
          ),
          const Spacer(),
          Text(
            item.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xff0C1A30),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.price,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: const Color(0xff313131),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Color(0xffFFC120)),
              const SizedBox(width: 4),
              Text('${item.rating}   ${item.reviews}',
                  style: const TextStyle(fontSize: 12)),
              const Spacer(),
              const Icon(Icons.more_vert, size: 14, color: Color(0xff838589)),
            ],
          ),
        ],
      ),
    );
  }
}
