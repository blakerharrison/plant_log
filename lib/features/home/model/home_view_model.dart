import 'package:equatable/equatable.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';

class HomeViewModel extends Equatable {
  final SpeciesEntity speciesEntity;
  final bool showSearch;
  final List<String> searchSuggestions;
  final bool showLoginWidget;
  final SpeciesEntity searchResult;
  final bool searchIsLoading;

  const HomeViewModel({
    this.speciesEntity = const SpeciesEntity(),
    this.showSearch = false,
    // TODO: Get from a JSON file stored somewhere to avoid having to update
    // the app everytime I want to change the suggestions.
    this.searchSuggestions = const [
      'Amur Maple',
      'Cactus',
      'Ghost',
      'Magic',
      'Bloodleaf',
    ],
    this.showLoginWidget = false,
    this.searchResult = const SpeciesEntity(),
    this.searchIsLoading = false,
  });

  @override
  List<Object?> get props => [
        speciesEntity,
        showSearch,
        searchSuggestions,
        showLoginWidget,
        searchResult,
        searchIsLoading,
      ];
}
