import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_project/core/domain/entities/sub_sample.dart';

class Sample {
  int id;
  List<SubSample> subSamples;
  @JsonKey(name: 'date_time')
  DateTime dateTime;

  Sample({required this.dateTime, required this.id, required this.subSamples});
}
