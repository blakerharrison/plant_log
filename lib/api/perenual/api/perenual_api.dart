import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_log/api/perenual/models/species_entity.dart';

class PerenualAPI {
  final String _authority = 'perenual.com';
  final _apiDirectory = '/api';
  final _speciesListPath = '/species-list';

  String get _apiKey {
    String apiKey = const String.fromEnvironment('PERENUAL_KEY');
    if (apiKey.isEmpty) {
      return '';
    }
    return apiKey;
  }


  Future<SpeciesEntity> speciesList(int page) async {
    Uri uri = Uri.https(_authority, _apiDirectory + _speciesListPath, {
      'page': page.toString(),
      'key': _apiKey,
    });
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      return SpeciesEntity.fromJson(decodedJson);
    } else {
      return const SpeciesEntity();
    }
  }
}