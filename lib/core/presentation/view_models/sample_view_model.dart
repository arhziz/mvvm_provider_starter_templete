import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/domain/entities/sample.dart';
import 'package:mvvm_project/core/domain/repositories/sample_repository.dart';

@dev
@LazySingleton()
class SampleViewModel extends ChangeNotifier {
  final ISampleRepository sampleRepo;
  SampleViewModel({required this.sampleRepo});

  List<Sample> _samples = [];
  int get totalSamples => _samples.length;
  bool sampleLoading = false;
  List<Sample> get samples => _samples;

  late Sample _selectedSample;

  Sample get selectedSample => _selectedSample;

  void getSamples() async {
    sampleLoading = true;
    notifyListeners();
    var result = await sampleRepo.getAllSamples();
    result.fold((error) {
      //log errors
    }, (success) {
      _samples = success;
    });
    sampleLoading = false;
    notifyListeners();
  }

  void getSampleDetails(int id) async {
    sampleLoading = true;
    notifyListeners();
    var result = await sampleRepo.getSample(id);
    result.fold((error) {
      //log errors
    }, (success) {
      _selectedSample = success;
    });
    sampleLoading = false;
    notifyListeners();
  }
}
