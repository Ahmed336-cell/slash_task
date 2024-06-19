import '../../data/models/product.dart';
import '../../data/services/data_services.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final DataService dataService;

  ProductRepositoryImpl(this.dataService);

  @override
  Future<Map<String, List<Product>>> fetchProducts() async {
    return await dataService.fetchProducts();
  }
}
