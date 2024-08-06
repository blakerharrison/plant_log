// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesEntity _$SpeciesEntityFromJson(Map<String, dynamic> json) =>
    SpeciesEntity(
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => SpeciesDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpeciesEntityToJson(SpeciesEntity instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

SpeciesDataEntity _$SpeciesDataEntityFromJson(Map<String, dynamic> json) =>
    SpeciesDataEntity(
      id: (json['id'] as num?)?.toInt(),
      commonName: json['common_name'] as String?,
      scientificName: (json['scientific_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      otherName: (json['other_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cycle: json['cycle'] as String?,
      watering: json['watering'] as String?,
      defaultImage: json['default_image'] == null
          ? null
          : SpeciesDefaultImageEntity.fromJson(
              json['default_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeciesDataEntityToJson(SpeciesDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'other_name': instance.otherName,
      'cycle': instance.cycle,
      'watering': instance.watering,
      'default_image': instance.defaultImage.toJson(),
    };

SpeciesDefaultImageEntity _$SpeciesDefaultImageEntityFromJson(
        Map<String, dynamic> json) =>
    SpeciesDefaultImageEntity(
      license: (json['license'] as num?)?.toInt(),
      licenseName: json['license_name'] as String?,
      licenseUrl: json['license_url'] as String?,
      originalUrl: json['original_url'] as String?,
      regularUrl: json['regular_url'] as String?,
      mediumUrl: json['medium_url'] as String?,
      smallUrl: json['small_url'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$SpeciesDefaultImageEntityToJson(
        SpeciesDefaultImageEntity instance) =>
    <String, dynamic>{
      'license': instance.license,
      'license_name': instance.licenseName,
      'license_url': instance.licenseUrl,
      'original_url': instance.originalUrl,
      'regular_url': instance.regularUrl,
      'medium_url': instance.mediumUrl,
      'small_url': instance.smallUrl,
      'thumbnail': instance.thumbnail,
    };
