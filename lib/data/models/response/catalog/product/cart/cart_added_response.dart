import '../../../base_response.dart';

class CartAddedResponse extends BaseResponse {
  CartAddedResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory CartAddedResponse.fromJson(Map<String, dynamic> json) {
    return CartAddedResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }

  String data;
}
