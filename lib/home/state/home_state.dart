import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';

final homeViewModelProvider = StateNotifierProvider<HomeState, SpeciesEntity>(
  (ref) => HomeState(),
);

class HomeState extends StateNotifier<SpeciesEntity> {
  final PerenualAPI perenualAPI;
  int page = 0;
  bool isLoading = false;

  HomeState({PerenualAPI? perenualAPI})
      : perenualAPI = perenualAPI ?? PerenualAPI(),
        super(const SpeciesEntity()) {
    fetchMoreSpeciesData();
  }

  void fetchMoreSpeciesData() async {
    if (isLoading) return;
    isLoading = true;
    SpeciesEntity speciesEntity = await perenualAPI.speciesList(page);
    if (speciesEntity.data.isNotEmpty) {
      state = SpeciesEntity(data: [...state.data, ...speciesEntity.data]);
      page++;
    }
    isLoading = false;
  }

  void cacheSelectedPlant(SpeciesDataEntity entity) {
    // Repository.cache(entity as Entity);
  }
}
