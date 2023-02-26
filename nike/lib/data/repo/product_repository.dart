import 'package:nike/data/model/product/product.dart';
import 'package:nike/data/source/product_data_Source.dart';
import 'package:nike/di/locator.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProduct(int sortBy);

  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductEntity>> getAllProduct(int sortBy) {
    return locator.get<ProductDataSource>().getAllProduct(0);
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) {
    return locator.get<ProductDataSource>().search(searchTerm);
  }
}
