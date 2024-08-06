import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plant_log/architecture/types/entity.dart';

part 'species_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class
SpeciesEntity implements Entity {
  @JsonKey(name: 'data')
  final List<SpeciesDataEntity> data;

  const SpeciesEntity({
    this.data = const [],
  });

  factory SpeciesEntity.fromJson(Map<String, dynamic> json) =>
      _$SpeciesEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpeciesEntityToJson(this);

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}

@JsonSerializable(explicitToJson: true)
class SpeciesDataEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'common_name')
  final String commonName;

  @JsonKey(name: 'scientific_name')
  final List<String> scientificName;

  @JsonKey(name: 'other_name')
  final List<String> otherName;

  @JsonKey(name: 'cycle')
  final String cycle;

  @JsonKey(name: 'watering')
  final String watering;

  // @JsonKey(name: 'sunlight')
  // final List<String> sunlight;

  @JsonKey(name: 'default_image')
  final SpeciesDefaultImageEntity defaultImage;

  SpeciesDataEntity({
    int? id,
    String? commonName,
    List<String>? scientificName,
    List<String>? otherName,
    String? cycle,
    String? watering,
    // TODO: Getting parsing error
    // List<String>? sunlight,
    SpeciesDefaultImageEntity? defaultImage,
  })  : id = id ?? -0,
        commonName = commonName ?? '',
        scientificName = scientificName ?? [],
        otherName = otherName ?? [],
        cycle = cycle ?? '',
        watering = watering ?? '',
        // sunlight = sunlight ?? [],
        defaultImage = defaultImage ?? const SpeciesDefaultImageEntity();

  factory SpeciesDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SpeciesDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesDataEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        commonName,
        scientificName,
        otherName,
        cycle,
        watering,
        // sunlight,
      ];
}

@JsonSerializable()
class SpeciesDefaultImageEntity extends Equatable {
  @JsonKey(name: 'license')
  final int license;

  @JsonKey(name: 'license_name')
  final String licenseName;

  @JsonKey(name: 'license_url')
  final String licenseUrl;

  @JsonKey(name: 'original_url')
  final String originalUrl;

  @JsonKey(name: 'regular_url')
  final String regularUrl;

  @JsonKey(name: 'medium_url')
  final String mediumUrl;

  @JsonKey(name: 'small_url')
  final String smallUrl;

  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  const SpeciesDefaultImageEntity({
    int? license,
    String? licenseName,
    String? licenseUrl,
    String? originalUrl,
    String? regularUrl,
    String? mediumUrl,
    String? smallUrl,
    String? thumbnail,
  })  : license = license ?? -0,
        licenseName = licenseName ?? '',
        licenseUrl = licenseUrl ?? '',
        originalUrl = originalUrl ?? '',
        regularUrl = regularUrl ?? '',
        mediumUrl = mediumUrl ?? '',
        smallUrl = smallUrl ?? '',
        thumbnail = thumbnail ?? '';

  factory SpeciesDefaultImageEntity.fromJson(Map<String, dynamic> json) =>
      _$SpeciesDefaultImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesDefaultImageEntityToJson(this);

  @override
  List<Object?> get props => [
        license,
        licenseName,
        licenseUrl,
        originalUrl,
        regularUrl,
        mediumUrl,
        smallUrl,
        thumbnail,
      ];
}
