import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/product.dart';
import '../../domain/repositories/product_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository productRepository;

  HomeCubit(this.productRepository) : super(HomeInitial());

  void addToFavorites(Product product) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedFavorites = List<Product>.from(currentState.favoruiteItems);
      if (!updatedFavorites.contains(product)) {
        updatedFavorites.add(product);
        emit(HomeLoaded(
          currentState.bestSellingProducts,
          currentState.newArrivals,
          currentState.recommendedProducts,
          updatedFavorites,
          currentState.cartItems,
        ));
      }
    }
  }

  void removeFromFavorites(Product product) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedFavorites = List<Product>.from(currentState.favoruiteItems);
      if (updatedFavorites.contains(product)) {
        updatedFavorites.remove(product);
        emit(HomeLoaded(
          currentState.bestSellingProducts,
          currentState.newArrivals,
          currentState.recommendedProducts,
          updatedFavorites,
          currentState.cartItems,
        ));
      }
    }
  }

  void addToCart(Product product) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedCartItems = List<Product>.from(currentState.cartItems);
      if (!updatedCartItems.contains(product)) {
        updatedCartItems.add(product);
        emit(HomeLoaded(
          currentState.bestSellingProducts,
          currentState.newArrivals,
          currentState.recommendedProducts,
          currentState.favoruiteItems,
          updatedCartItems,
        ));
      }
    }
  }

  void removeFromCart(Product product) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedCartItems = List<Product>.from(currentState.cartItems);
      if (updatedCartItems.contains(product)) {
        updatedCartItems.remove(product);
        emit(HomeLoaded(
          currentState.bestSellingProducts,
          currentState.newArrivals,
          currentState.recommendedProducts,
          currentState.favoruiteItems,
          updatedCartItems,
        ));
      }
    }
  }

  void fetchProducts() async {
    try {
      final products = await productRepository.fetchProducts();
      emit(HomeLoaded(
        products['bestSelling']!,
        products['newArrival']!,
        products['recommendedForYou']!,
        [],
        [],
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}