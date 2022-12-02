import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/app/app_env.dart';
import '../../../../core/database/secure_storage/secure_storage_manager.dart';
import '../../../../core/network/api_request.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/api_url.dart';
import '../../../models/response/user/user.dart';
import 'auth_api.dart';

class AuthApiImpl implements AuthApi {
  String tag = 'Auth Api';

  @override
  Future<User> login({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await sendRequest(
        url: ApiUrl.login,
        requestMethod: RequestMethod.POST,
        body: {
          'phone': phoneNumber,
          'password': password,
          'email': email,
        },
      );
      return User.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      log('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<User> verifyToken({
    required int userId,
    required String token,
  }) async {
    try {
      final String? token = await SecureStorageManager.find.getToken();
      String url = AppEnv.find.get.baseUrl;
      url += ApiUrl.verifyToken;
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            'Accept': Headers.jsonContentType,
            'Client-Token': AppEnv.find.get.clientToken,
          },
          contentType: Headers.jsonContentType,
        ),
      );
      return User.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      log('$tag Error = $e');
      rethrow;
    }
  }
}