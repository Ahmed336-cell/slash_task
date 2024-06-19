part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> bestSellingProducts;
  final List<Product> newArrivals;
  final List<Product> recommendedProducts;
  final List<Product> favoruiteItems;
  final List<Product> cartItems;

  HomeLoaded(this.bestSellingProducts, this.newArrivals, this.recommendedProducts, this.favoruiteItems, this.cartItems);

  @override
  List<Object> get props => [bestSellingProducts, newArrivals, recommendedProducts, favoruiteItems, cartItems];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object> get props => [message];
}
