import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';
import 'package:plant_log/features/home/model/home_view_model.dart';

final homeViewModelProvider = StateNotifierProvider<HomeState, HomeViewModel>(
  (ref) => HomeState(),
);

class HomeState extends StateNotifier<HomeViewModel> {
  final PerenualAPI perenualAPI;
  int page = 0;
  bool isLoading = false;
  bool showSearch = false;
  bool showLoginWidget = false;

  HomeState({PerenualAPI? perenualAPI})
      : perenualAPI = perenualAPI ?? PerenualAPI(),
        super(const HomeViewModel()) {
    fetchMoreSpeciesData();
  }

  void fetchMoreSpeciesData() async {
    if (isLoading) return;
    isLoading = true;
    SpeciesEntity speciesEntity = await perenualAPI.speciesList(page);
    if (speciesEntity.data.isNotEmpty) {
      state = HomeViewModel(
        speciesEntity: SpeciesEntity(
          data: [...state.speciesEntity.data, ...speciesEntity.data],
        ),
      );
      page++;
    }
    isLoading = false;
  }

  void cacheSelectedPlant(SpeciesDataEntity entity) {
    // Repository.cache(entity as Entity);
  }

  void toggleSearch() {
    state = HomeViewModel(
      speciesEntity: state.speciesEntity,
      showSearch: !state.showSearch,
      showLoginWidget: state.showLoginWidget,
    );
  }

  void search(String query) {
    // TODO: Only make network call after ever 1 second
    log('SEARCH FOR: $query');
  }

  void toggleLoginWidget() {
    state = HomeViewModel(
      speciesEntity: state.speciesEntity,
      showSearch: state.showSearch,
      showLoginWidget: !state.showLoginWidget,
    );
  }
}
