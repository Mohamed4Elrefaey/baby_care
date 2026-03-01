import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      String errorMessage = 'Opps There was an Error, Please try again';
      if (response is Map) {
        if (response['error'] is Map && response['error']['message'] != null) {
          errorMessage = response['error']['message'];
        } else if (response['message'] != null) {
          errorMessage = response['message'];
        }
      }
      return ServerFailure(errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromSocketException(SocketException e) {
    final message = e.message.toLowerCase();

    if (message.contains('failed host lookup')) {
      return ServerFailure('No internet connection');
    } else if (message.contains('network is unreachable')) {
      return ServerFailure('Network is unreachable');
    } else if (message.contains('connection refused')) {
      return ServerFailure('Cannot connect to the server');
    } else if (message.contains('no route to host')) {
      return ServerFailure('No route to host');
    } else {
      return ServerFailure('No internet connection');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
