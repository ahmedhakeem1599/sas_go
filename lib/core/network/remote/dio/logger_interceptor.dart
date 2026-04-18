import 'package:pretty_dio_logger/pretty_dio_logger.dart';

PrettyDioLogger loggerInterceptor() {
  return PrettyDioLogger(
    error: true,
    requestBody: true,
    responseBody: true,
  );
}

