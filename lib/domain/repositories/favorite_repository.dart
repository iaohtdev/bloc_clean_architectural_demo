import 'package:bloc_clean_architectural_demo/data/models/product_model.dart';

abstract class FavoriteRepository {
  Future<void> addToFavorites(ProductItem product);
  Future<void> removeFromFavorites(int productId);
  bool isFavorite(int productId);
  List<ProductItem> getFavorites();
}
