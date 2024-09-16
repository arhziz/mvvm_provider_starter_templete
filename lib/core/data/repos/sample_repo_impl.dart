import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/data/data_sources/interfaces/i_sample_data_source.dart';
import 'package:mvvm_project/core/domain/entities/sample.dart';
import 'package:mvvm_project/core/domain/repositories/sample_repository.dart';
import 'package:mvvm_project/core/errors/error.dart';
import 'package:mvvm_project/core/typedef.dart';

@dev
@Injectable(as: ISampleRepository)
class SampleRepoImpl implements ISampleRepository {
  final ISampleDataSource dataSource;

  SampleRepoImpl(this.dataSource);

  @override
  ResultFuture<List<Sample>> getAllSamples() async {
    try {
      var result = await dataSource.getAllSamples();
      return right(result);
    } on DioException catch (ex) {
      //catch the exception
      return left(ApiError(err: ex));
    } on PlatformException catch (ex) {
      return left(PlatfromError(message: ex.message));
    }
  }

  @override
  ResultFuture<Sample> getSample(int id) async {
    try {
      var result = await dataSource.getSample(id);
      return right(result);
    } on DioException catch (ex) {
      //catch the exception
      return left(ApiError(err: ex));
    } on PlatformException catch (ex) {
      return left(PlatfromError(message: ex.message));
    }
  }
}
