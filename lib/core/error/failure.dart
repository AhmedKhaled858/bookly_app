import 'package:dio/dio.dart';

abstract class Failure {
    final String message;

  Failure( this.message);
}
class ServerFailure extends Failure {
  ServerFailure(super.message);
 factory ServerFailure.fromDiorError(DioError error) {
    switch(error.type){
      case DioExceptionType.connectionTimeout:
      return ServerFailure('Connection Timeout with api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
       return ServerFailure.fromresponse(error.response!.statusCode!, error.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure('opps something went wrong, try again later');
    }
  }
  factory ServerFailure.fromresponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else if (response is Map<String, dynamic> && response.containsKey('message')) {
      return ServerFailure(response['message']);
    } else {
      return ServerFailure('Unknown Error');
    }
  }
}