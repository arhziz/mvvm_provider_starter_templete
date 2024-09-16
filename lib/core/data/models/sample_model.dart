import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_project/core/domain/entities/sample.dart';
import 'package:mvvm_project/core/domain/entities/sub_sample.dart';

part 'sample_model.g.dart';

@JsonSerializable()
class SampleModel extends Sample {
  SampleModel({
    required super.dateTime,
    required super.id,
    required this.subSamples,
  }) : super(
          subSamples: subSamples,
        );

  @JsonKey(
      name: 'sub_sample',
      fromJson: _ListSubSampleConverter.fromJSON,
      toJson: _ListSubSampleConverter.toJSON)
  //Using json serializable would require an override on the base field otherwise an error would be thrown when running build runner
  //You could choose not to use the package
  @override
  List<SubSample> subSamples;

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}

class _ListSubSampleConverter
    extends JsonConverter<List<SubSample>, Map<String, dynamic>?> {
  _ListSubSampleConverter();

  static Map<String, dynamic>? toJSON(List<SubSample>? object) {
    if (object == null) return null;
    return null;
  }

  static List<SubSample> fromJSON(List<dynamic>? json) {
    if (json == null) return [];
    return json
        .map<SubSample>((subSample) => SubSample(
            title: subSample['title'], subTitle: subSample['sub_title']))
        .toList();
  }

  @override
  List<SubSample> fromJson(Map<String, dynamic>? json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(List<SubSample>? object) {
    throw UnimplementedError();
  }
}
