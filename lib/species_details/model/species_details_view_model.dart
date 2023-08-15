import 'package:equatable/equatable.dart';
import 'package:plant_log/api/perenual/models/plant_details_entity.dart';

class SpeciesDetailsViewModel extends Equatable {
  final bool isLoading;
  final SpeciesDetailsEntity speciesDetailsEntity;

  const SpeciesDetailsViewModel({
    this.isLoading = false,
    SpeciesDetailsEntity? speciesDetailsEntity,
  }) : speciesDetailsEntity =
      speciesDetailsEntity ?? const SpeciesDetailsEntity();

  @override
  List<Object?> get props => [
    isLoading,
    speciesDetailsEntity,
  ];
}