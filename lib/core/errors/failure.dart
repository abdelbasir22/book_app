import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServierFailure extends Failure {
  ServierFailure(super.errMessage);

  factory ServierFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServierFailure('Connection timeout with ApiService');

      case DioExceptionType.sendTimeout:
        return ServierFailure('Send timeout with ApiService');

      case DioExceptionType.receiveTimeout:
        return ServierFailure('Receive timeout with ApiService');

      case DioExceptionType.badResponse:
        return ServierFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServierFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServierFailure('No Internet Connection');
        }
        return ServierFailure('Unexpected Error, Please try again!');

      default:
        return ServierFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServierFailure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400 || statesCode == 401 || statesCode == 403) {
      return ServierFailure(response['error']['message']);
    } else if (statesCode == 404) {
      return ServierFailure('Your request not found ,please try later!');
    } else if (statesCode == 500) {
      return ServierFailure('Internal Server error, Please try later');
    } else {
      return ServierFailure('Opps There was an Error, Please try again');
    }
  }
}
