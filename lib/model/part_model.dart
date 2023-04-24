import 'package:json_annotation/json_annotation.dart';

part 'part_model.g.dart';

@JsonSerializable()
class PartModel {
  PartModel({
    required this.title,
    required this.defaultMicroScheme,
    required this.defaultElectricScheme,
    required this.defaultAsset,
    this.defaultDocumentation = "",
    this.partsMap = const {},
    this.microSchemeMap = const {},
    this.electricSchemeMap = const {},
    this.documentationMap = const {},
    this.defaultElementAsset,
    this.elementPartsMap,
  });

  final String title;
  final String defaultMicroScheme;
  final String defaultElectricScheme;
  final String defaultAsset;
  @JsonKey(defaultValue: "")
  final String defaultDocumentation;

  @JsonKey(defaultValue: {})
  final Map<String, String> partsMap;
  @JsonKey(defaultValue: {})
  final Map<String, String> microSchemeMap;
  @JsonKey(defaultValue: {})
  final Map<String, String> electricSchemeMap;
  @JsonKey(defaultValue: {})
  final Map<String, String> documentationMap;

  final Map<String, String>? elementPartsMap;
  final String? defaultElementAsset;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PartModel.fromJson(Map<String, dynamic> json) =>
      _$PartModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PartModelToJson(this);
}
