import 'package:bloc_clean_architectural_demo/data/models/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> fetchProduct({int? page, int? limit});
  Future<List<ProductItem>> search({
    String? query,
  });
}
