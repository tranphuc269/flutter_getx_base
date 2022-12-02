import '../../../../models/response/catalog/product/cart/cart_data.dart';
import '../../../../models/response/catalog/product/product_data.dart';

abstract class CartService {
  Future<CartData> getMyCart();
}
