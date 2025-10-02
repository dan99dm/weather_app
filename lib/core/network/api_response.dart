enum ApiResponseErrorType {
  network,
  badRequest,
  server,
  unknown,
}

sealed class ApiResponse<T> {}

class ApiResponseData<T> extends ApiResponse<T> {
  final T data;

  ApiResponseData({required this.data});

  @override
  String toString() {
    return 'ApiResponseData\n'
        'data: $data';
  }
}

class ApiResponseError<T> extends ApiResponse<T> {
  final ApiResponseErrorType type;

  ApiResponseError({
    required this.type,
  });

  factory ApiResponseError.networkError() {
    return ApiResponseError(type: ApiResponseErrorType.network);
  }

  factory ApiResponseError.badRequest() {
    return ApiResponseError(type: ApiResponseErrorType.badRequest);
  }

  factory ApiResponseError.internalError() {
    return ApiResponseError(type: ApiResponseErrorType.server);
  }

  factory ApiResponseError.unknown() {
    return ApiResponseError(type: ApiResponseErrorType.unknown);
  }

  @override
  String toString() {
    return 'ApiResponseError, type: $type';
  }
}
