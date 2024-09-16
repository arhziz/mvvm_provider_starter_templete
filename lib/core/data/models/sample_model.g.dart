// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) => SampleModel(
      dateTime: DateTime.parse(json['date_time'] as String),
      id: (json['id'] as num).toInt(),
      subSamples: _ListSubSampleConverter.fromJSON(json['sub_sample'] as List?),
    );

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_time': instance.dateTime.toIso8601String(),
      'sub_sample': _ListSubSampleConverter.toJSON(instance.subSamples),
    };
