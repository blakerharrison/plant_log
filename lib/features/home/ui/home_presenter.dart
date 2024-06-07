import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/features/species_details/ui/species_details_view.dart';

class HomePresenter {
  void navigateToSpeciesDetails(BuildContext context, {required int id}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProviderScope(
          overrides: [
            selectedSpeciesId.overrideWithValue(id),
          ],
          child: const SpeciesDetailsView(),
        ),
      ),
    );
  }
}
