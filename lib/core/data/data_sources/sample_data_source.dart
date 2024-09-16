import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/data/data_sources/interfaces/i_sample_data_source.dart';
import 'package:mvvm_project/core/data/models/sample_model.dart';
import 'package:mvvm_project/core/http_client/i_http_client.dart';

@dev
@Injectable(as: ISampleDataSource)
class SampleDataSource implements ISampleDataSource {
  final IHttpClient httpClient;
  SampleDataSource({required this.httpClient});

  @override
  Future<List<SampleModel>> getAllSamples() async {
    await Future.delayed(const Duration(seconds: 2));

    var data = await rootBundle.loadString("assets/jsons/sample.json");
    List<SampleModel> result = (json.decode(data) as List)
        .map<SampleModel>((sample) => SampleModel.fromJson(sample))
        .toList();
    return result;
  }

  @override
  Future<SampleModel> getSample(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    var data = await rootBundle.loadString("assets/jsons/sample.json");
    List<SampleModel> result = (json.decode(data) as List)
        .map<SampleModel>((sample) => SampleModel.fromJson(sample))
        .toList();

    return result.firstWhere((sample) => sample.id == id);
  }
}
