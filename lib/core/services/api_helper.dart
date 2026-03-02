import 'dart:io';

import 'package:baby_care/core/constants.dart';
import 'package:dio/dio.dart';
import '../helper/shared_preferences_service.dart';

class ApiHelper {
  Dio dio;
  final String baseUrl = 'https://vax.teqnyah.com/api/';

  ApiHelper(this.dio);

  Future<String?> _getAuthToken() async {
    return await SharedPreferencesService.getData(key: Constants.tokeneKey);
  }

  Future<Options?> _createAuthOptions(bool requiresAuth) async {
    if (requiresAuth) {
      String? token = await _getAuthToken();
      if (token != null) {
        return Options(headers: {'Authorization': 'Bearer $token'});
      }
    }
    return null;
  }

  Future<Response> uploadFile(
    String endpoint, {
    required File file,
    String fieldName = 'file',
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);

    String fileName = file.path.split('/').last;

    FormData formData = FormData.fromMap({
      fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await dio.post(
      '$baseUrl$endpoint',
      data: formData,
      options: options,
    );
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
    CancelToken? cancelToken,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);

    return await dio.get(
      '$baseUrl$endpoint',
      queryParameters: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.post('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.put('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.delete('$baseUrl$endpoint', data: data, options: options);
  }
}
