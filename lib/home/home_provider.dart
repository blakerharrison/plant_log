import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/species_entity.dart';
import 'package:http/http.dart' as http;

final speciesViewModelProvider =
    StateNotifierProvider<SpeciesViewModel, SpeciesEntity>(
  (ref) => SpeciesViewModel(),
);

class SpeciesViewModel extends StateNotifier<SpeciesEntity> {
  int page = 0;
  bool isLoading = false;

  SpeciesViewModel() : super(const SpeciesEntity()) {
    fetchMoreSpeciesData();
  }

  void fetchMoreSpeciesData() async {
    if (isLoading) return;
    isLoading = true;
    http.Response response = await fetchSpeciesDataResponse();
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      SpeciesEntity speciesEntity = SpeciesEntity.fromJson(decodedJson);
      state = SpeciesEntity(
        data: [...state.data, ...speciesEntity.data],
      );
      page++;
    } else {
      log('Error', error: response.body);
      log(response.statusCode.toString());
    }
    isLoading = false;
  }

  Future<http.Response> fetchSpeciesDataResponse() {
    Uri uri = Uri.https('perenual.com', '/api/species-list', {
      'page': page.toString(),
      'key': 'sk-UkWy64c7efbabcf241722',
    });
    return http.get(uri);
  }
}
