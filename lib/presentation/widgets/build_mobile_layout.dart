import 'package:flutter/material.dart';
import 'package:slash_task/presentation/widgets/product_list.dart';
import 'package:slash_task/presentation/widgets/search_bar.dart';

import '../cubit/home_cubit.dart';
import 'announc_image.dart';
import 'category_list.dart';
import 'details_bar.dart';
class BuildMobileLayout extends StatelessWidget {
  const BuildMobileLayout({super.key, required this.state});
  final HomeLoaded state;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsBar(),
            const SearchBarWidget(),
            const AnnounceImage(heightPercent: 0.15),
            CategoryList(),
            Center(
              child: ProductList(
                title: 'Best Selling',
                products: state.bestSellingProducts,
              ),
            ),
            Center(
              child: ProductList(
                title: 'New Arrivals',
                products: state.newArrivals,
              ),
            ),
            Center(
              child: ProductList(
                title: 'Recommended for you',
                products: state.recommendedProducts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}