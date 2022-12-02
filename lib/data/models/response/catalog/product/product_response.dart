import '../../base_response.dart';
import 'product_data.dart';

class ProductListResponse extends BaseResponse {
  ProductListResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List).map((e) => ProductData.fromJson(e)).toList(),
    );
  }

  List<ProductData> data;
}

class ProductSingleResponse extends BaseResponse {
  ProductSingleResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ProductSingleResponse.fromJson(Map<String, dynamic> json) {
    return ProductSingleResponse(
      code: json['code'],
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }

  ProductData data;
}
