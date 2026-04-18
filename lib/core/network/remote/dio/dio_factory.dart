import 'package:dio/dio.dart';
import '../../local/secure_storage_service.dart';
import '../api/api_constants.dart';
import 'auth_interceptor.dart';
import 'logger_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 20);
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      // _dio!.interceptors.addAll([
      //   AuthInterceptor(sl<SecureStorageService>()),
      //   loggerInterceptor()
      // ]);
    }

    return _dio!;
  }
}
