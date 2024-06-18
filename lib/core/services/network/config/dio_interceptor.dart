import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log request details
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // If the response is successful, just pass it to the next handler
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Log error details
    String errorMessage = 'Error occurred: ';
    if (err.response != null) {
      // Handling based on status code
      switch (err.response?.statusCode) {
        case 400:
          errorMessage += 'Unauthorized Exception: ${err.response?.data.toString()}';
          break;
        case 500:
          errorMessage += 'Server Exception: ${err.response?.data.toString()}';
          break;
        default:
          errorMessage += 'Unknown API Exception: ${err.response?.data.toString()}';
          break;
      }
    } else {
      // Handling other Dio errors
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage += 'Connection timeout';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage += 'Send timeout';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage += 'Receive timeout';
          break;
        case DioExceptionType.badCertificate:
          errorMessage += 'Bad Certificate';
          break;
        case DioExceptionType.cancel:
          errorMessage += 'Request cancelled';
          break;
        case DioExceptionType.connectionError:
          errorMessage += 'Connection Error';
          break;
        case DioExceptionType.unknown:
          errorMessage += 'Request unknown: ${err.error}';
          break;
        case DioExceptionType.badResponse:
          errorMessage += 'Bad Response: ${err.error}';
          break;
      }
    }

    // Modify the error and pass it along
    DioException modifiedError = DioException(
      requestOptions: err.requestOptions,
      error: errorMessage,
      type: err.type,
      response: err.response,
    );

    return handler.next(modifiedError);
  }
}
