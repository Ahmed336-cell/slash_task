import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/presentation/cubit/home_cubit.dart';
import '../../data/models/product.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Product> products;

  ProductList({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isNormal) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.21,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          bool isFavorite = state is HomeLoaded && state.favoruiteItems.contains(product);
                          return Card(
                            color: Colors.white,
                            shadowColor: Colors.white,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        product.imageUrl,
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: () {
                                          final cubit = context.read<HomeCubit>();
                                          if (isFavorite) {
                                            cubit.removeFromFavorites(product);
                                          } else {
                                            cubit.addToFavorites(product);
                                          }
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: isFavorite ? Colors.red : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF292929),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'EGP ${product.price.toString()}',
                                        style: const TextStyle(
                                          color: Color(0xFF292929),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                       Row(
                                        children: [
                                          const Icon(Icons.adobe_rounded),
                                          GestureDetector(
                                              onTap: () {
                                                final cubit = context.read<HomeCubit>();
                                                cubit.addToCart(product);
                                              },
                                              child: const Icon(Icons.add_circle_rounded)
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                int crossAxisCount = sizingInformation.isDesktop ? 4 : 2;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final isFavorite = state is HomeLoaded && state.favoruiteItems.contains(product);
                        return Card(
                          color: Colors.white,
                          shadowColor: Colors.white,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      product.imageUrl,
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        final cubit = context.read<HomeCubit>();
                                        if (isFavorite) {
                                          cubit.removeFromFavorites(product);
                                        } else {
                                          cubit.addToFavorites(product);
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: isFavorite ? Colors.red : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF292929),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'EGP ${product.price.toString()}',
                                      style: const TextStyle(
                                        color: Color(0xFF292929),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                     Row(
                                      children: [
                                        const Icon(Icons.adobe_rounded),
                                        GestureDetector(
                                            onTap: () {
                                              final cubit = context.read<HomeCubit>();
                                              cubit.addToCart(product);
                                            },
                                            child: const Icon(Icons.add_circle_rounded)
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
