import '../base_response.dart';
import 'producer_data.dart';

class ProducerResponse extends BaseResponse {
  ProducerResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ProducerResponse.fromJson(Map<String, dynamic> json) {
    return ProducerResponse(
      code: json['code'],
      message: json['message'],
      data:
          (json['data'] as List).map((e) => ProducerData.fromJson(e)).toList(),
    );
  }

  List<ProducerData> data;
}
