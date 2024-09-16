import 'package:mvvm_project/core/data/models/sample_model.dart';

abstract class ISampleDataSource {
  Future<List<SampleModel>> getAllSamples();
  Future<SampleModel> getSample(int id);
}
