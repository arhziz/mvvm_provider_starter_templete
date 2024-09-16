//N.B i'm using Interface naming convention for absract classes that are meant to act like interfaces
import 'package:mvvm_project/core/domain/entities/sample.dart';
import 'package:mvvm_project/core/typedef.dart';

abstract class ISampleRepository {
  ResultFuture<Sample> getSample(int id);
  ResultFuture<List<Sample>> getAllSamples();
}
