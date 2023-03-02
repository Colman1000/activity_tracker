import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class AppException implements Exception {
  @pragma('vm:entry-point')
  const AppException(
      [this.message = defaultMessage, Object? data, StackTrace? trace]);

  factory AppException.fromPlatformException(PlatformException e) {
    String msg = defaultMessage;

    switch (e.code) {
      case 'sign_in_canceled':
        msg = 'Sign-in cancelled';
        break;

      case 'network_error':
        msg = 'Check your internet connection';
        break;

      case 'sign_in_failed':
        msg = 'Sign-in failed';
        break;

      default:
        msg = e.message ?? defaultMessage;
        break;
    }

    return AppException(msg);
  }

  factory AppException.fromDio(DioError e) {
    String message = defaultMessage;

    switch (e.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        message = 'Timeout: Check you internet connection';
        break;
      case DioErrorType.badResponse:
        message = 'Invalid server response';
        break;
      case DioErrorType.cancel:
        message = 'Request cancelled';
        break;

      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        message = 'Unexpected Error';
    }

    return AppException(message);
  }

  final String message;

  @override
  String toString() {
    return message;
  }

  static const String defaultMessage = 'Unexpected Error';
}
