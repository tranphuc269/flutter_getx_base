import '../../../../../core/network/api_request.dart';
import '../../../../models/response/catalog/product/cart/cart_data.dart';
import '../../../../models/response/catalog/product/cart/cart_response.dart';
import '../../../../models/response/catalog/product/product_data.dart';
import 'cart_service.dart';

class CartServiceImpl extends CartService {

  @override
  Future<CartData> getMyCart() async{
    // TODO: implement getMyCart
    const url = '/order-service/cart';
    // TODO: implement getProductBySortPageSize
    final _res = await sendRequest(
      url: url,
      requestMethod: RequestMethod.GET,
      useToken: true,
    );
    final CartResponse cart = CartResponse.fromJson(_res.data);
    return cart.data;
  }
}
