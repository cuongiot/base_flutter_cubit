import 'package:base_mvvm_cubit/core/base/base_response/error_response.dart';
import 'package:base_mvvm_cubit/core/utils/navigation_service.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:base_mvvm_cubit/generated/l10n.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late ErrorResponse failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

ErrorResponse _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ErrorResponse(error.response?.statusCode ?? 0,
            error.response?.data["message"] ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  ErrorResponse getFailure() {
    var mContext = serviceLocator<NavigationService>().navigatorContext;
    switch (this) {
      case DataSource.SUCCESS:
        return ErrorResponse(ResponseCode.SUCCESS, S.of(mContext).success);
      case DataSource.NO_CONTENT:
        return ErrorResponse(
            ResponseCode.NO_CONTENT, S.of(mContext).strNoContent);
      case DataSource.BAD_REQUEST:
        return ErrorResponse(
            ResponseCode.BAD_REQUEST, S.of(mContext).strBadRequestError);
      case DataSource.FORBIDDEN:
        return ErrorResponse(
            ResponseCode.FORBIDDEN, S.of(mContext).strForbiddenError);
      case DataSource.UNAUTORISED:
        return ErrorResponse(
            ResponseCode.UNAUTORISED, S.of(mContext).strUnauthorizedError);
      case DataSource.NOT_FOUND:
        return ErrorResponse(
            ResponseCode.NOT_FOUND, S.of(mContext).strNotFoundError);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ErrorResponse(ResponseCode.INTERNAL_SERVER_ERROR,
            S.of(mContext).strInternalServerError);
      case DataSource.CONNECT_TIMEOUT:
        return ErrorResponse(
            ResponseCode.CONNECT_TIMEOUT, S.of(mContext).strTimeoutError);
      case DataSource.CANCEL:
        return ErrorResponse(
            ResponseCode.CANCEL,
            S
                .of(mContext)
                .strDefaultError); // Assuming default error for cancel
      case DataSource.RECIEVE_TIMEOUT:
        return ErrorResponse(
            ResponseCode.RECIEVE_TIMEOUT, S.of(mContext).strTimeoutError);
      case DataSource.SEND_TIMEOUT:
        return ErrorResponse(
            ResponseCode.SEND_TIMEOUT, S.of(mContext).strTimeoutError);
      case DataSource.CACHE_ERROR:
        return ErrorResponse(
            ResponseCode.CACHE_ERROR, S.of(mContext).strCacheError);
      case DataSource.NO_INTERNET_CONNECTION:
        return ErrorResponse(ResponseCode.NO_INTERNET_CONNECTION,
            S.of(mContext).strNoInternetError);
      case DataSource.DEFAULT:
        return ErrorResponse(
            ResponseCode.DEFAULT, S.of(mContext).strDefaultError);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}
