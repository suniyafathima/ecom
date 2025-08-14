import 'package:ecom/controller/home_controller.dart';
import 'package:ecom/widgets/bannersection.dart';
import 'package:ecom/widgets/categorylist.dart';
import 'package:ecom/widgets/headersection.dart';
import 'package:ecom/widgets/producthorizontallist.dart';
import 'package:ecom/widgets/searchbar.dart';
import 'package:ecom/widgets/sectionheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, _) {
           SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,  
              statusBarIconBrightness: Brightness.dark, 
            ),
          );
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
                    HeaderSection(),
                    const SizedBox(height: 17),
                    SearchBarr(),
                    const SizedBox(height: 17),
                    BannerSection(),
                    const SizedBox(height: 23),

                    SectionHeader(title: 'Categories', actionText: 'See All'),
                    const SizedBox(height: 12),
                    CategoryList(items: productRes?.categories?.items ?? []),
                    const SizedBox(height: 24),

                    SectionHeader(title: 'Top Selling', actionText: 'View All'),
                    const SizedBox(height: 12),
                    ProductHorizontalList(
                      products: productRes?.topSellingItems?.items ?? [],
                    ),
                    const SizedBox(height: 24),

                    SectionHeader(title: 'Best offers', actionText: 'View All'),
                    const SizedBox(height: 12),
                    ProductHorizontalList(
                      products: productRes?.bestOffers?.items ?? [],
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
