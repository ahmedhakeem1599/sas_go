class ErrorModel {
  final int code;
  final String errorMessage;

  ErrorModel({required this.code, required this.errorMessage});

  factory ErrorModel.fromJson(dynamic jsonData) {
    // لو null → unknown error
    if (jsonData == null) {
      return ErrorModel(
        code: 500,
        errorMessage: "Unknown error occurred",
      );
    }

    // لو String
    if (jsonData is String) {
      return ErrorModel(
        code: 500,
        errorMessage: jsonData,
      );
    }

    if (jsonData is Map) {
      return ErrorModel(
        code: jsonData["code"] ??  500,
        errorMessage: jsonData["message"] ?? "Unknown error",
      );
    }
    return ErrorModel(
      code: 500,
      errorMessage: "Unknown error occurred",
    );

  }
}