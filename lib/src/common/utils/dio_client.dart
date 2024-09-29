import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioHttpClient {
  Dio get dio;
}

class DioHttpClientImpl implements DioHttpClient {
  DioHttpClientImpl(
    this._dio,
    this.logger,
  ) {
    _configureDioClient(
      dio: _dio,
    );
  }

  final Dio _dio;
  final Logger logger;

  @override
  Dio get dio => _dio;

  void _configureDioClient({
    required Dio dio,
  }) {
    dio.options
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60)
      ..validateStatus = (int? status) {
        return status.toString().startsWith('20');
      };
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ),
      );
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            logger.e('DioException: ${e.type} - ${e.message}');
            return handler.next(e);
          },
        ),
      );
    }
  }
}
