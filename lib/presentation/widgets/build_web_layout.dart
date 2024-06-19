import 'package:flutter/material.dart';
import 'package:slash_task/presentation/cubit/home_cubit.dart';
import 'package:slash_task/presentation/widgets/product_list.dart';
import 'package:slash_task/presentation/widgets/search_bar.dart';

import 'announc_image.dart';
import 'category_list.dart';
import 'details_bar.dart';
class BuildWebLayout extends StatelessWidget {
  const BuildWebLayout({super.key, required this.state});
  final HomeLoaded state;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailsBar(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const SearchBarWidget(),
                ),
              ),
              const AnnounceImage(heightPercent: 0.50),
              CategoryList(),
              ProductList(
                title: 'Best Selling',
                products: state.bestSellingProducts,
              ),
              ProductList(
                title: 'New Arrivals',
                products: state.newArrivals,
              ),
              ProductList(
                title: 'Recommended for you',
                products: state.recommendedProducts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}