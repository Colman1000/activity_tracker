import 'dart:developer';
import 'dart:io';

import 'package:activity_tracker/models/app_exception.dart';
import 'package:flutter/services.dart';

/// A helper class that wraps possible error codeblocks with a simple API to
/// handle errors
class SafeRequest {
  static Future<T?> run<T>(
    Future<T> Function() func, {
    void Function(AppException e)? onError,
    VoidCallback? onFinally,
    T? defaultValue,
  }) async {
    final localErrorHandler = onError ??
        (e) => log(e.message,
            stackTrace: StackTrace.current, name: 'SAFE_REQUEST', error: e);
    errorHandler(AppException e, {StackTrace? stackTrace}) {
      /// TODO: Report to Sentry
      localErrorHandler(e);
    }

    try {
      return await func();
    } on AppException catch (e) {
      errorHandler(e);
    } on SocketException {
      errorHandler(const AppException('No Internet connection 😑'));
    } on HttpException {
      errorHandler(const AppException('Resource not found 😱'));
    } on FormatException {
      errorHandler(const AppException('Bad response format 👎'));
    } on PlatformException catch (e) {
      errorHandler(AppException.fromPlatformException(e));
    } catch (e) {
      errorHandler(const AppException());
    } finally {
      onFinally?.call();
    }
    return defaultValue;
  }
}
