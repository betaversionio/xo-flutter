import 'package:dio/dio.dart';

/// Standardized exception for all API-layer errors.
class ApiException implements Exception {
  ApiException(this.message, [this.statusCode]) : _isNetworkConnectivityError = false;

  ApiException._(this.message, this.statusCode, this._isNetworkConnectivityError);

  /// Converts a [DioException] into a user-friendly [ApiException].
  factory ApiException.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException._('Connection timeout', 408, true);
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException._('Request timeout', 408, true);
      case DioExceptionType.connectionError:
        return ApiException._('No internet connection', null, true);
      case DioExceptionType.badResponse:
        return ApiException._(
          e.response?.data['message'] as String? ?? 'Server error',
          e.response?.statusCode,
          false,
        );
      case DioExceptionType.cancel:
        return ApiException._('Request cancelled', null, false);
      case DioExceptionType.badCertificate:
        return ApiException._('Certificate error', null, false);
      default:
        return ApiException._('An error occurred: ${e.message}', null, false);
    }
  }

  final String message;
  final int? statusCode;
  final bool _isNetworkConnectivityError;

  /// True for actual network connectivity issues (timeout, no internet).
  bool get isNetworkError => _isNetworkConnectivityError;

  /// True if the server responded with HTTP 403.
  bool get isForbidden => statusCode == 403;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
