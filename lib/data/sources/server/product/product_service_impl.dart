import '../../../../core/network/api_request.dart';
import '../../../models/response/catalog/product/cart/cart_added_request.dart';
import '../../../models/response/catalog/product/cart/cart_added_response.dart';
import '../../../models/response/catalog/product/product_data.dart';
import '../../../models/response/catalog/product/product_response.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  @override
  Future<void> addToCart(
      {required Function() onSuccess,
      required Function() onFailure,
      required CartAddedRequest cartRequest}) async {
    try {
      const url = '/catalog-service/add-to-cart';
      // TODO: implement getAllBanner
      final _res = await sendRequest(
        url: url,
        requestMethod: RequestMethod.POST,
        useToken: true,
        body: cartRequest.toJson(),
      );
      final CartAddedResponse producer = CartAddedResponse.fromJson(_res.data);
      onSuccess();
    } on Exception {
      onFailure();
    }
  }

  @override
  Future<List<ProductData>> getProductBySortPageSize(
      {required String sort, required int page, required int size}) async {
    final url = '/catalog-service/products?sort=$sort&page=$page&size=$size';
    // TODO: implement getProductBySortPageSize
    final _res = await sendRequest(
      url: url,
      requestMethod: RequestMethod.GET,
      useToken: true,
    );
    final ProductListResponse product = ProductListResponse.fromJson(_res.data);
    return product.data;
  }

  @override
  Future<ProductData> getSingleProduct({required String productId}) async {
    // TODO: implement getSingleProduct
    final url = '/catalog-service/product/$productId';
    final _res = await sendRequest(
      url: url,
      requestMethod: RequestMethod.GET,
      useToken: true,
    );
    final ProductSingleResponse product =
        ProductSingleResponse.fromJson(_res.data);
    return product.data;
  }
}
