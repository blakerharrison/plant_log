import 'package:equatable/equatable.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';

class HomeViewModel extends Equatable {
  final SpeciesEntity speciesEntity;
  final bool showSearch;

  const HomeViewModel({
    this.speciesEntity = const SpeciesEntity(),
    this.showSearch = false,
  });

  @override
  List<Object?> get props => [
    speciesEntity,
    showSearch,
  ];
}