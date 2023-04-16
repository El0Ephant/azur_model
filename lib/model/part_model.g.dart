// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartModel _$PartModelFromJson(Map<String, dynamic> json) => PartModel(
      title: json['title'] as String,
      defaultMicroScheme: json['defaultMicroScheme'] as String,
      defaultElectricScheme: json['defaultElectricScheme'] as String,
      defaultAsset: json['defaultAsset'] as String,
      defaultDocumentation: json['defaultDocumentation'] as String? ?? '',
      partsMap: (json['partsMap'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
      microSchemeMap: (json['microSchemeMap'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
      electricSchemeMap:
          (json['electricSchemeMap'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              {},
      documentationMap:
          (json['documentationMap'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              {},
    );

Map<String, dynamic> _$PartModelToJson(PartModel instance) => <String, dynamic>{
      'title': instance.title,
      'defaultMicroScheme': instance.defaultMicroScheme,
      'defaultElectricScheme': instance.defaultElectricScheme,
      'defaultAsset': instance.defaultAsset,
      'defaultDocumentation': instance.defaultDocumentation,
      'partsMap': instance.partsMap,
      'microSchemeMap': instance.microSchemeMap,
      'electricSchemeMap': instance.electricSchemeMap,
      'documentationMap': instance.documentationMap,
    };
