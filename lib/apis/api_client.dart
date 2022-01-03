import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  ApiClient({
    required this.baseUrl,
  }) {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        QueuedInterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            options.headers = <String, dynamic>{
              'Accept': 'application/json',
              'content-type': 'application/json',
            };
            handler.next(options);
          },
          onError: (DioError error, ErrorInterceptorHandler handler) {
            if (error.error is SocketException) {
              throw UserException('no internet');
            }

            return handler.reject(error);
          },
        ),
      );

    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }
  }

  final String baseUrl;
  late Dio dio;
}
