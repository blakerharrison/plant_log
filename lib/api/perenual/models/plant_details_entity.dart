import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SpeciesDetailsEntity extends Equatable {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'common_name')
  final String commonName;

  @JsonKey(name: 'scientific_name')
  final List<String> scientificName;

  @JsonKey(name: 'other_name')
  final List<String> otherName;

  @JsonKey(name: 'family')
  final String family;

  @JsonKey(name: 'origin')
  final List<String> origin;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'dimensions')
  final Dimensions dimensions;

  @JsonKey(name: 'cycle')
  final String cycle;

  @JsonKey(name: 'watering')
  final String watering;

  @JsonKey(name: 'depth_water_requirement')
  final List<DepthWaterRequirement> depthWaterRequirement;

  @JsonKey(name: 'volume_water_requirement')
  final dynamic volumeWaterRequirement;

  @JsonKey(name: 'watering_period')
  final String wateringPeriod;

  @JsonKey(name: 'watering_general_benchmark')
  final WateringGeneralBenchmark wateringGeneralBenchmark;

  @JsonKey(name: 'plant_anatomy')
  final List<Map<String, dynamic>> plantAnatomy;

  @JsonKey(name: 'sunlight')
  final List<String> sunlight;

  @JsonKey(name: 'pruning_month')
  final List<String> pruningMonth;

  @JsonKey(name: 'attracts')
  final List<String> attracts;

  @JsonKey(name: 'propagation')
  final List<String> propagation;

  @JsonKey(name: 'hardiness')
  final Hardness hardiness;

  @JsonKey(name: 'hardiness_location')
  final HardnessLocation hardinessLocation;

  @JsonKey(name: 'flowers')
  final bool? flowers;

  @JsonKey(name: 'flowering_season')
  final String floweringSeason;

  @JsonKey(name: 'color')
  final String color;

  @JsonKey(name: 'soil')
  final List<String> soil;

  @JsonKey(name: 'pest_susceptibility')
  final List<String> pestSusceptibility;

  @JsonKey(name: 'cones')
  final bool? cones;

  @JsonKey(name: 'fruits')
  final bool? fruits;

  @JsonKey(name: 'edible_fruit')
  final bool? edibleFruit;

  @JsonKey(name: 'fruit_color')
  final List<String> fruitColor;

  @JsonKey(name: 'fruiting_season')
  final String fruitingSeason;

  @JsonKey(name: 'harvest_season')
  final String harvestSeason;

  @JsonKey(name: 'harvest_method')
  final String harvestMethod;

  @JsonKey(name: 'leaf')
  final bool? leaf;

  @JsonKey(name: 'leaf_color')
  final List<String> leafColor;

  @JsonKey(name: 'edible_leaf')
  final bool? edibleLeaf;

  @JsonKey(name: 'growth_rate')
  final String growthRate;

  @JsonKey(name: 'maintenance')
  final String maintenance;

  @JsonKey(name: 'medicinal')
  final bool? medicinal;

  @JsonKey(name: 'poisonous_to_humans')
  final int? poisonousToHumans;

  @JsonKey(name: 'poisonous_to_pets')
  final int? poisonousToPets;

  @JsonKey(name: 'drought_tolerant')
  final bool? droughtTolerant;

  @JsonKey(name: 'salt_tolerant')
  final bool? saltTolerant;

  @JsonKey(name: 'thorny')
  final bool? thorny;

  @JsonKey(name: 'invasive')
  final bool? invasive;

  @JsonKey(name: 'rare')
  final bool? rare;

  @JsonKey(name: 'rare_level')
  final String rareLevel;

  @JsonKey(name: 'tropical')
  final bool? tropical;

  @JsonKey(name: 'cuisine')
  final bool? cuisine;

  @JsonKey(name: 'indoor')
  final bool? indoor;

  @JsonKey(name: 'care_level')
  final String careLevel;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'default_image')
  final DefaultImage defaultImage;

  const SpeciesDetailsEntity({
    this.id,
    this.commonName = '',
    this.scientificName = const [],
    this.otherName = const [],
    this.family = '',
    this.origin = const [],
    this.type = '',
    this.dimensions = const Dimensions(),
    this.cycle = '',
    this.watering = '',
    this.depthWaterRequirement = const [],
    this.volumeWaterRequirement = const [],
    this.wateringPeriod = '',
    this.wateringGeneralBenchmark = const WateringGeneralBenchmark(),
    this.plantAnatomy = const [],
    this.sunlight = const [],
    this.pruningMonth = const [],
    this.attracts = const [],
    this.propagation = const [],
    this.hardiness = const Hardness(),
    this.hardinessLocation = const HardnessLocation(),
    this.flowers,
    this.floweringSeason = '',
    this.color = '',
    this.soil = const [],
    this.pestSusceptibility = const [],
    this.cones,
    this.fruits,
    this.edibleFruit,
    this.fruitColor = const [],
    this.fruitingSeason = '',
    this.harvestSeason = '',
    this.harvestMethod = '',
    this.leaf,
    this.leafColor = const [],
    this.edibleLeaf,
    this.growthRate = '',
    this.maintenance = '',
    this.medicinal,
    this.poisonousToHumans,
    this.poisonousToPets,
    this.droughtTolerant,
    this.saltTolerant,
    this.thorny,
    this.invasive,
    this.rare,
    this.rareLevel = '',
    this.tropical,
    this.cuisine,
    this.indoor,
    this.careLevel = '',
    this.description = '',
    this.defaultImage = const DefaultImage(),
  });

  factory SpeciesDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$SpeciesDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesDetailsEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        commonName,
        scientificName,
        otherName,
        family,
        origin,
        type,
        dimensions,
        cycle,
        watering,
        depthWaterRequirement,
        volumeWaterRequirement,
        wateringPeriod,
        wateringGeneralBenchmark,
        plantAnatomy,
        sunlight,
        pruningMonth,
        attracts,
        propagation,
        hardiness,
        hardinessLocation,
        flowers,
        floweringSeason,
        color,
        soil,
        pestSusceptibility,
        cones,
        fruits,
        edibleFruit,
        fruitColor,
        fruitingSeason,
        harvestSeason,
        harvestMethod,
        leaf,
        leafColor,
        edibleLeaf,
        growthRate,
        maintenance,
        medicinal,
        poisonousToHumans,
        poisonousToPets,
        droughtTolerant,
        saltTolerant,
        thorny,
        invasive,
        rare,
        rareLevel,
        tropical,
        cuisine,
        indoor,
        careLevel,
        description,
        defaultImage,
      ];
}

@JsonSerializable()
class Dimensions extends Equatable {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'min_value')
  final double? minValue;

  @JsonKey(name: 'max_value')
  final double? maxValue;

  @JsonKey(name: 'unit')
  final String unit;

  const Dimensions({
    this.type = '',
    this.minValue,
    this.maxValue,
    this.unit = '',
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);

  @override
  List<Object?> get props => [
        type,
        minValue,
        maxValue,
        unit,
      ];
}

@JsonSerializable()
class DepthWaterRequirement extends Equatable {
  @JsonKey(name: 'unit')
  final String unit;

  @JsonKey(name: 'value')
  final String value;

  const DepthWaterRequirement({
    this.unit = '',
    this.value = '',
  });

  factory DepthWaterRequirement.fromJson(Map<String, dynamic> json) =>
      _$DepthWaterRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$DepthWaterRequirementToJson(this);

  @override
  List<Object?> get props => [
        unit,
        value,
      ];
}

@JsonSerializable()
class VolumeWaterRequirement extends Equatable {
  @JsonKey(name: 'unit')
  final String unit;

  @JsonKey(name: 'value')
  final String value;

  const VolumeWaterRequirement({
    this.unit = '',
    this.value = '',
  });

  factory VolumeWaterRequirement.fromJson(Map<String, dynamic> json) =>
      _$VolumeWaterRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeWaterRequirementToJson(this);

  @override
  List<Object?> get props => [
        unit,
        value,
      ];
}

@JsonSerializable()
class WateringGeneralBenchmark extends Equatable {
  @JsonKey(name: 'unit')
  final String unit;

  @JsonKey(name: 'value')
  final String value;

  const WateringGeneralBenchmark({
    this.unit = '',
    this.value = '',
  });

  factory WateringGeneralBenchmark.fromJson(Map<String, dynamic> json) =>
      _$WateringGeneralBenchmarkFromJson(json);

  Map<String, dynamic> toJson() => _$WateringGeneralBenchmarkToJson(this);

  @override
  List<Object?> get props => [
        unit,
        value,
      ];
}

@JsonSerializable()
class PruningCount extends Equatable {
  @JsonKey(name: 'amount')
  final int? amount;

  @JsonKey(name: 'interval')
  final String interval;

  const PruningCount({
    this.amount,
    this.interval = '',
  });

  factory PruningCount.fromJson(Map<String, dynamic> json) =>
      _$PruningCountFromJson(json);

  Map<String, dynamic> toJson() => _$PruningCountToJson(this);

  @override
  List<Object?> get props => [
        amount,
        interval,
      ];
}

@JsonSerializable()
class Hardness extends Equatable {
  @JsonKey(name: 'min')
  final String min;

  @JsonKey(name: 'max')
  final String max;

  const Hardness({
    this.min = '',
    this.max = '',
  });

  factory Hardness.fromJson(Map<String, dynamic> json) =>
      _$HardnessFromJson(json);

  Map<String, dynamic> toJson() => _$HardnessToJson(this);

  @override
  List<Object?> get props => [
        min,
        max,
      ];
}

@JsonSerializable()
class HardnessLocation extends Equatable {
  @JsonKey(name: 'full_url')
  final String fullUrl;

  @JsonKey(name: 'full_iframe')
  final String fullIFrame;

  const HardnessLocation({
    this.fullUrl = '',
    this.fullIFrame = '',
  });

  factory HardnessLocation.fromJson(Map<String, dynamic> json) =>
      _$HardnessLocationFromJson(json);

  Map<String, dynamic> toJson() => _$HardnessLocationToJson(this);

  @override
  List<Object?> get props => [
        fullUrl,
        fullIFrame,
      ];
}

@JsonSerializable()
class DefaultImage extends Equatable {
  @JsonKey(name: 'image_id')
  final int? imageID;

  @JsonKey(name: 'license')
  final int? license;

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

  const DefaultImage({
    this.imageID,
    this.license,
    this.licenseName = '',
    this.licenseUrl = '',
    this.originalUrl = '',
    this.regularUrl = '',
    this.mediumUrl = '',
    this.smallUrl = '',
    this.thumbnail = '',
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) =>
      _$DefaultImageFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultImageToJson(this);

  @override
  List<Object?> get props => [
        imageID,
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
