import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/presentation/cubit/home_cubit.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            if (state.cartItems.isEmpty) {
              return const Center(
                child: Text('No items in the cart'),
              );
            }

            // Calculate the total price
            final totalPrice = state.cartItems.fold<double>(
              0.0,
                  (sum, item) => sum + item.price,
            );

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.imageUrl),
                        title: Text(product.name),
                        subtitle: Text('EGP ${product.price.toString()}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            context.read<HomeCubit>().removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Price:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'EGP ${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
