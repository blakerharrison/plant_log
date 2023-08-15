// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesDetailsEntity _$SpeciesDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    SpeciesDetailsEntity(
      id: json['id'] as int?,
      commonName: json['common_name'] as String? ?? '',
      scientificName: (json['scientific_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      otherName: (json['other_name'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      family: json['family'] as String? ?? '',
      origin: (json['origin'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      type: json['type'] as String? ?? '',
      dimensions: json['dimensions'] == null
          ? const Dimensions()
          : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      cycle: json['cycle'] as String? ?? '',
      watering: json['watering'] as String? ?? '',
      depthWaterRequirement: (json['depth_water_requirement'] as List<dynamic>?)
              ?.map((e) =>
                  DepthWaterRequirement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      volumeWaterRequirement: json['volume_water_requirement'] ?? const [],
      wateringPeriod: json['watering_period'] as String? ?? '',
      wateringGeneralBenchmark: json['watering_general_benchmark'] == null
          ? const WateringGeneralBenchmark()
          : WateringGeneralBenchmark.fromJson(
              json['watering_general_benchmark'] as Map<String, dynamic>),
      plantAnatomy: (json['plant_anatomy'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      sunlight: (json['sunlight'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pruningMonth: (json['pruning_month'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attracts: (json['attracts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      propagation: (json['propagation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hardiness: json['hardiness'] == null
          ? const Hardness()
          : Hardness.fromJson(json['hardiness'] as Map<String, dynamic>),
      hardinessLocation: json['hardiness_location'] == null
          ? const HardnessLocation()
          : HardnessLocation.fromJson(
              json['hardiness_location'] as Map<String, dynamic>),
      flowers: json['flowers'] as bool?,
      floweringSeason: json['flowering_season'] as String? ?? '',
      color: json['color'] as String? ?? '',
      soil:
          (json['soil'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      pestSusceptibility: (json['pest_susceptibility'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cones: json['cones'] as bool?,
      fruits: json['fruits'] as bool?,
      edibleFruit: json['edible_fruit'] as bool?,
      fruitColor: (json['fruit_color'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fruitingSeason: json['fruiting_season'] as String? ?? '',
      harvestSeason: json['harvest_season'] as String? ?? '',
      harvestMethod: json['harvest_method'] as String? ?? '',
      leaf: json['leaf'] as bool?,
      leafColor: (json['leaf_color'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      edibleLeaf: json['edible_leaf'] as bool?,
      growthRate: json['growth_rate'] as String? ?? '',
      maintenance: json['maintenance'] as String? ?? '',
      medicinal: json['medicinal'] as bool?,
      poisonousToHumans: json['poisonous_to_humans'] as int?,
      poisonousToPets: json['poisonous_to_pets'] as int?,
      droughtTolerant: json['drought_tolerant'] as bool?,
      saltTolerant: json['salt_tolerant'] as bool?,
      thorny: json['thorny'] as bool?,
      invasive: json['invasive'] as bool?,
      rare: json['rare'] as bool?,
      rareLevel: json['rare_level'] as String? ?? '',
      tropical: json['tropical'] as bool?,
      cuisine: json['cuisine'] as bool?,
      indoor: json['indoor'] as bool?,
      careLevel: json['care_level'] as String? ?? '',
      description: json['description'] as String? ?? '',
      defaultImage: json['default_image'] == null
          ? const DefaultImage()
          : DefaultImage.fromJson(
              json['default_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeciesDetailsEntityToJson(
        SpeciesDetailsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'other_name': instance.otherName,
      'family': instance.family,
      'origin': instance.origin,
      'type': instance.type,
      'dimensions': instance.dimensions.toJson(),
      'cycle': instance.cycle,
      'watering': instance.watering,
      'depth_water_requirement':
          instance.depthWaterRequirement.map((e) => e.toJson()).toList(),
      'volume_water_requirement': instance.volumeWaterRequirement,
      'watering_period': instance.wateringPeriod,
      'watering_general_benchmark': instance.wateringGeneralBenchmark.toJson(),
      'plant_anatomy': instance.plantAnatomy,
      'sunlight': instance.sunlight,
      'pruning_month': instance.pruningMonth,
      'attracts': instance.attracts,
      'propagation': instance.propagation,
      'hardiness': instance.hardiness.toJson(),
      'hardiness_location': instance.hardinessLocation.toJson(),
      'flowers': instance.flowers,
      'flowering_season': instance.floweringSeason,
      'color': instance.color,
      'soil': instance.soil,
      'pest_susceptibility': instance.pestSusceptibility,
      'cones': instance.cones,
      'fruits': instance.fruits,
      'edible_fruit': instance.edibleFruit,
      'fruit_color': instance.fruitColor,
      'fruiting_season': instance.fruitingSeason,
      'harvest_season': instance.harvestSeason,
      'harvest_method': instance.harvestMethod,
      'leaf': instance.leaf,
      'leaf_color': instance.leafColor,
      'edible_leaf': instance.edibleLeaf,
      'growth_rate': instance.growthRate,
      'maintenance': instance.maintenance,
      'medicinal': instance.medicinal,
      'poisonous_to_humans': instance.poisonousToHumans,
      'poisonous_to_pets': instance.poisonousToPets,
      'drought_tolerant': instance.droughtTolerant,
      'salt_tolerant': instance.saltTolerant,
      'thorny': instance.thorny,
      'invasive': instance.invasive,
      'rare': instance.rare,
      'rare_level': instance.rareLevel,
      'tropical': instance.tropical,
      'cuisine': instance.cuisine,
      'indoor': instance.indoor,
      'care_level': instance.careLevel,
      'description': instance.description,
      'default_image': instance.defaultImage.toJson(),
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
      type: json['type'] as String? ?? '',
      minValue: (json['min_value'] as num?)?.toDouble(),
      maxValue: (json['max_value'] as num?)?.toDouble(),
      unit: json['unit'] as String? ?? '',
    );

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'type': instance.type,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'unit': instance.unit,
    };

DepthWaterRequirement _$DepthWaterRequirementFromJson(
        Map<String, dynamic> json) =>
    DepthWaterRequirement(
      unit: json['unit'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$DepthWaterRequirementToJson(
        DepthWaterRequirement instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

VolumeWaterRequirement _$VolumeWaterRequirementFromJson(
        Map<String, dynamic> json) =>
    VolumeWaterRequirement(
      unit: json['unit'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$VolumeWaterRequirementToJson(
        VolumeWaterRequirement instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

WateringGeneralBenchmark _$WateringGeneralBenchmarkFromJson(
        Map<String, dynamic> json) =>
    WateringGeneralBenchmark(
      unit: json['unit'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$WateringGeneralBenchmarkToJson(
        WateringGeneralBenchmark instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

PruningCount _$PruningCountFromJson(Map<String, dynamic> json) => PruningCount(
      amount: json['amount'] as int?,
      interval: json['interval'] as String? ?? '',
    );

Map<String, dynamic> _$PruningCountToJson(PruningCount instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'interval': instance.interval,
    };

Hardness _$HardnessFromJson(Map<String, dynamic> json) => Hardness(
      min: json['min'] as String? ?? '',
      max: json['max'] as String? ?? '',
    );

Map<String, dynamic> _$HardnessToJson(Hardness instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

HardnessLocation _$HardnessLocationFromJson(Map<String, dynamic> json) =>
    HardnessLocation(
      fullUrl: json['full_url'] as String? ?? '',
      fullIFrame: json['full_iframe'] as String? ?? '',
    );

Map<String, dynamic> _$HardnessLocationToJson(HardnessLocation instance) =>
    <String, dynamic>{
      'full_url': instance.fullUrl,
      'full_iframe': instance.fullIFrame,
    };

DefaultImage _$DefaultImageFromJson(Map<String, dynamic> json) => DefaultImage(
      imageID: json['image_id'] as int?,
      license: json['license'] as int?,
      licenseName: json['license_name'] as String? ?? '',
      licenseUrl: json['license_url'] as String? ?? '',
      originalUrl: json['original_url'] as String? ?? '',
      regularUrl: json['regular_url'] as String? ?? '',
      mediumUrl: json['medium_url'] as String? ?? '',
      smallUrl: json['small_url'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$DefaultImageToJson(DefaultImage instance) =>
    <String, dynamic>{
      'image_id': instance.imageID,
      'license': instance.license,
      'license_name': instance.licenseName,
      'license_url': instance.licenseUrl,
      'original_url': instance.originalUrl,
      'regular_url': instance.regularUrl,
      'medium_url': instance.mediumUrl,
      'small_url': instance.smallUrl,
      'thumbnail': instance.thumbnail,
    };
