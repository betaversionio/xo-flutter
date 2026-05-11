// HTTP client configuration using Dio for {{ inputs.projectName }}.

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Full API base URL read from .env — set API_BASE_URL in your .env file.
String get baseApiUrl => dotenv.env['API_BASE_URL'] ?? 'https://api.example.com/v1';

/// Riverpod provider for the configured Dio HTTP client.
final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseApiUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
      },
    ),
  );

  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    hitCacheOnErrorCodes: [500],
    hitCacheOnNetworkFailure: true,
    maxStale: const Duration(days: 7),
  );

  // 1. Cache
  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

  // 2. Logger — last so it sees the final request state
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  return dio;
});
