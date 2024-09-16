import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  final String? message;
  final int statusCode;

  const AppError({required this.message, required this.statusCode});

  @override
  List<Object> get props => [statusCode];
}

//ignore: must_be_immutable
class ApiError extends AppError {
  //Modify Dio Errors here
  DioException? err;
  ApiError({this.err, super.message, super.statusCode = 500});

  String get errorMessage {
    return "${err?.message}";
  }
}

class PlatfromError extends AppError {
  const PlatfromError(
      {super.message = "Error Occured", super.statusCode = 400});
}
