import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/logger/logger.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/species_details/model/species_details_view_model.dart';

class SpeciesDetailsState extends StateNotifier<SpeciesDetailsViewModel> {
  final PerenualAPI perenualAPI;
  bool isLoading = true;
  final int? id;

  SpeciesDetailsState({PerenualAPI? perenualAPI, this.id})
      : perenualAPI = perenualAPI ?? PerenualAPI(),
        super(const SpeciesDetailsViewModel()) {
    fetchSpeciesDetails();
  }

  Future<void> fetchSpeciesDetails() async {
    if (id == null) {
      isLoading = false;
      Logger.error('ID is null');
      return;
    }
    final speciesDetailsEntity = await perenualAPI.speciesDetails(id!);
    state = SpeciesDetailsViewModel(speciesDetailsEntity: speciesDetailsEntity);
    Logger.event('$speciesDetailsEntity');
  }
}
