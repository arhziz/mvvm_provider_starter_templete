import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/errors/error.dart';

typedef ResultFuture<T> = Future<Either<AppError, T>>;
typedef ResultVoid<T> = Future<Either<AppError, void>>;
