import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';

final speciesViewModelProvider =
    StateNotifierProvider<SpeciesViewModel, SpeciesEntity>(
  (ref) => SpeciesViewModel(),
);

class SpeciesViewModel extends StateNotifier<SpeciesEntity> {
  final PerenualAPI perenualAPI;
  int page = 0;
  bool isLoading = false;

  SpeciesViewModel({PerenualAPI? perenualAPI})
      : perenualAPI = perenualAPI ?? PerenualAPI(),
        super(const SpeciesEntity()) {
    fetchMoreSpeciesData();
  }

  void fetchMoreSpeciesData() async {
    if (isLoading) return;
    isLoading = true;
    SpeciesEntity speciesEntity = await perenualAPI.speciesList(page);
    if (speciesEntity.data.isNotEmpty) {
      state = SpeciesEntity(
        data: [...state.data, ...speciesEntity.data],
      );
      page++;
    }
    isLoading = false;
  }

  void fetchSpeciesDetails(int id) async {
    if (isLoading) return;
    isLoading = true;
    final speciesDetailsEntity =
        await perenualAPI.speciesDetails(id);
    if (speciesDetailsEntity.id != null) {
      log('🌵 Plant Details $speciesDetailsEntity');
    }
    isLoading = false;
  }
}
