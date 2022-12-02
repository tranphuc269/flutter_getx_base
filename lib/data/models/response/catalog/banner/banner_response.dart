import '../../base_response.dart';
import 'banner_data.dart';

class BannerResponse extends BaseResponse {
  BannerResponse(
      {required super.code, required super.message, required this.data});

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List).map((e) => BannerData.fromJson(e)).toList(),
    );
  }

  List<BannerData> data;
}
