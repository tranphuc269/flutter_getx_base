import '../../../base_response.dart';
import '../product_data.dart';
import 'cart_data.dart';

class CartResponse extends BaseResponse {
  CartResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      code: json['code'],
      message: json['message'],
      data: CartData.fromJson(json['data']),
    );
  }

  CartData data;
}
