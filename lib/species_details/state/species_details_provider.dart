
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/species_details/model/species_details_view_model.dart';
import 'package:plant_log/species_details/state/species_details_state.dart';

final speciesDetailsViewModelProvider = StateNotifierProvider.autoDispose<
    SpeciesDetailsState, SpeciesDetailsViewModel>(
      (ref) => SpeciesDetailsState(),
);
