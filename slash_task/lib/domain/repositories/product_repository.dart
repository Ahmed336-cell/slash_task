import '../../data/models/product.dart';

abstract class ProductRepository {
  Future<Map<String, List<Product>>> fetchProducts();
}
