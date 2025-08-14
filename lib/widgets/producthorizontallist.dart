import 'package:ecom/widgets/productcard.dart';
import 'package:ecom/widgets/productitem.dart';
import 'package:flutter/material.dart';

class ProductHorizontalList extends StatelessWidget {
  final List products;
  const ProductHorizontalList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 248,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final apiItem = products[index];
          return ProductCard(
            item: ProductItem(
              title: apiItem.name?.toString() ?? '',
              price: "Rs. ${apiItem.price ?? 0}",
              rating: "4.5",
              reviews: "N/A",
              imageAsset: apiItem.thumbnailImage ?? '',
            ),
          );
        },
      ),
    );
  }
}