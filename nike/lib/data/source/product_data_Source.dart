import 'package:nike/data/model/product/product.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/utils/http_client.dart';
import 'package:nike/utils/http_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductEntity>> getAllProduct(int sortBy);

  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductDataSource with ResponseValidator implements IProductDataSource {
  @override
  Future<List<ProductEntity>> getAllProduct(int sortBy) async {
    final getProductResponse = await locator
        .get<HttpClient>()
        .httpClient
        .get('product/list?sort=$sortBy');
    responseValidator(getProductResponse);
    final List<ProductEntity> productList = [];
    (getProductResponse.data as List<dynamic>).forEach((element) {
      productList.add(ProductEntity.fromJson(element));
    });
    return productList;
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) async {
    final getSearchResponse = await locator
        .get<HttpClient>()
        .httpClient
        .get('product/search?q=$searchTerm');
    responseValidator(getSearchResponse);
    final List<ProductEntity> searchProductList = [];
    (getSearchResponse.data as List<dynamic>).forEach((element) {
      searchProductList.add(ProductEntity.fromJson(element));
    });
    return searchProductList;
  }
}
