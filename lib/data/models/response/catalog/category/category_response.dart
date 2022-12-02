import '../../base_response.dart';
import 'category_data.dart';

class CategoryResponse extends BaseResponse {
  CategoryResponse(
      {required super.code, required super.message, required this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      code: json['code'],
      message: json['message'],
      data:
          (json['data'] as List).map((e) => CategoryData.fromJson(e)).toList(),
    );
  }

  List<CategoryData> data;
}
