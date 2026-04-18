import 'package:dio/dio.dart';
import '../../error/exception.dart';
import '../dio/dio_factory.dart';


class DioConsumer {

  final Dio _dio = DioFactory.getDio();

  /// CRUD Methods

  /// Get
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  /// Post
  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  /// Put
  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  /// Delete
  Future<dynamic> delete(String endPoint) async {
    try {
      final response = await _dio.delete(endPoint);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}