import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:slash_task/presentation/cubit/home_cubit.dart';
import 'package:slash_task/data/models/product.dart';
import 'package:slash_task/domain/repositories/product_repository.dart';

// Mock ProductRepository using Mockito
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  group('HomeCubit', () {
    late HomeCubit homeCubit;
    late MockProductRepository mockProductRepository;

    setUp(() {
      mockProductRepository = MockProductRepository();
      homeCubit = HomeCubit(mockProductRepository);
    });

    tearDown(() {
      homeCubit.close();
    });

    test('Initial state is HomeInitial', () {
      expect(homeCubit.state, HomeInitial());
    });

    test('fetchProducts emits HomeLoaded with products on success', () {
      final mockProducts = {
        'bestSelling': [
          Product(id: 1, name: 'Product 1', imageUrl: 'image1.jpg', price: 10.0),
        ],
        'newArrival': [
          Product(id: 2, name: 'Product 2', imageUrl: 'image2.jpg', price: 20.0),
        ],
        'recommendedForYou': [
          Product(id: 3, name: 'Product 3', imageUrl: 'image3.jpg', price: 30.0),
        ],
      };

      // Stub the fetchProducts method of MockProductRepository
      when(mockProductRepository.fetchProducts())
          .thenAnswer((_) async => mockProducts);

      // Expect HomeCubit to emit HomeLoaded state with mock products
      final expectedStates = [
        HomeLoaded(
          mockProducts['bestSelling']!,
          mockProducts['newArrival']!,
          mockProducts['recommendedForYou']!,
          [],
          [],
        ),
      ];

      expectLater(homeCubit.stream, emitsInOrder(expectedStates));

      // Trigger fetchProducts method
      homeCubit.fetchProducts();
    });

    test('addToFavorites updates favorites list', () {
      final productToAdd = Product(id: 1, name: 'Product 1', imageUrl: 'image1.jpg', price: 10.0);

      // Prepare initial state with some products
      homeCubit.emit(HomeLoaded(
        [],
        [],
        [],
        [],
        [],
      ));

      // Trigger addToFavorites method
      homeCubit.addToFavorites(productToAdd);

      // Expect state to be updated with product added to favorites
      expect(
        homeCubit.state,
        HomeLoaded(
          [],
          [],
          [],
          [productToAdd],
          [],
        ),
      );
    });

    // Similar tests can be written for addToCart and removeFromCart methods
    // Ensure to cover edge cases, error handling, and state transitions

    test('removeFromFavorites updates favorites list', () {
      final productToRemove = Product(id: 1, name: 'Product 1', imageUrl: 'image1.jpg', price: 10.0);

      // Prepare initial state with some products in favorites
      homeCubit.emit(HomeLoaded(
        [],
        [],
        [],
        [productToRemove],
        [],
      ));

      // Trigger removeFromFavorites method
      homeCubit.removeFromFavorites(productToRemove);

      // Expect state to be updated with product removed from favorites
      expect(
        homeCubit.state,
        HomeLoaded(
          [],
          [],
          [],
          [],
          [],
        ),
      );
    });
  });
}
