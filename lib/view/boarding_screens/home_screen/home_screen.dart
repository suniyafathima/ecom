import 'package:ecom/controller/home_controller.dart';
import 'package:ecom/core/services/login_api_services.dart';
import 'package:ecom/model/product_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final productRes = controller.productRes;

          return Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
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
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            Text(
                              "Let's start shopping",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9C2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border, size: 24),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 16),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF9C2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.notifications_none),
                                    onPressed: () {},
                                  ),
                                ),
                                Positioned(
                                  width: 9,
                                  height: 9,
                                  top: 12,
                                  right: 12,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFC95A5A),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    // Search Bar
                    Container(
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
                    ),

                    const SizedBox(height: 17),

                    // Onam Banner
                    const BannerSection(),

                    const SizedBox(height: 23),

                    // Categories
                    const _SectionHeader(title: 'Categories', actionText: 'See All'),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRes?.categories?.items?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final category = productRes?.categories?.items?[index];
                          if (category == null) return const SizedBox();
                          return CategoryItem(label: category.categoryName ?? '');
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Top Selling
                    const _SectionHeader(title: 'Top Selling', actionText: 'View All'),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 248,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRes?.topSellingItems?.items?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final apiItem = productRes?.topSellingItems?.items?[index];
                          if (apiItem == null) return const SizedBox();
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
                    ),

                    const SizedBox(height: 24),

                    // Best Offers
                    const _SectionHeader(title: 'Best offers', actionText: 'View All'),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 248,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRes?.bestOffers?.items?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final apiItem = productRes?.bestOffers?.items?[index];
                          if (apiItem == null) return const SizedBox();
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
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// Banner Section
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

// Section Header
class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const _SectionHeader({required this.title, required this.actionText});

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
            color: Color(0xff272727)
          ),
        ),
        Text(
          actionText,
          style: GoogleFonts.poppins(
           
            fontSize: 14,
            color: Color(0xff272727),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// Category Item
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
          decoration: BoxDecoration(
            color: const Color(0xFFE6E6E6),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            label[0],
            style: const TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(height: 5,),
        Expanded(
          child: SizedBox(
            height: 19,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12,
                                     fontWeight: FontWeight.w400
                                     ),
            ),
          ),
        ),
      ],
    );
  }
}

// Product Model
class ProductItem {
  final String title, price, rating, reviews, imageAsset;
  ProductItem({
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageAsset,
  });
 }

// Dummy Data
// final categories = ['Men', 'Women', 'Food', 'Gifts', 'Flowers'];

// final topSellingItems = [
//   ProductItem(
//     title: 'Onam Gift box',
//     price: 'Rs. 1500.00',
//     rating: '4.6',
//     reviews: '86 Reviews',
//     imageAsset: 'assets/gift_box.png',
//   ),
//   ProductItem(
//     title: 'Onam mund-sett',
//     price: 'Rs. 750.00',
//     rating: '4.6',
//     reviews: '86 Reviews',
//     imageAsset: 'assets/mundu.png',
//   ),
// ];

// final bestOffers = [
//   ProductItem(
//     title: 'Sadhiya',
//     price: 'Rs. 450.00',
//     rating: '4.8',
//     reviews: '96 Reviews',
//     imageAsset: 'assets/sadya.png',
//   ),
//   ProductItem(
//     title: 'Payasam',
//     price: 'Rs. 650.00',
//     rating: '4.7',
//     reviews: '56 Reviews',
//     imageAsset: 'assets/payasam.png',
//   ),
// ];

//product Card Widget
class ProductCard extends StatelessWidget {
  final ProductItem item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      padding: const EdgeInsets.only(top: 15,right:10,bottom:15,left:10),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
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
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.broken_image, color: Colors.grey, size: 48),
            const SizedBox(height: 8),
            Text(
              'Image not available',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  },
),

      Spacer(),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color:Color(0xff0C1A30),
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.price,
            style: GoogleFonts.poppins(fontSize: 12,
             fontWeight: FontWeight.w700,
             color: Color(0xff313131),
             letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.star, size: 14, color: Color(0xffFFC120)),
              const SizedBox(width: 4),
              Text('${ item.rating}   ${ item.reviews}',
                  style: const TextStyle(fontSize: 12)),
              Spacer(),
              Icon(Icons.more_vert,size:14,color: Color(0xff838589),)
            ],
          ),
        ],
      ),
    );
  }
}
