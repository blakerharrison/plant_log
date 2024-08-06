import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_log/api/logger/logger.dart';
import 'package:plant_log/api/perenual/models/species_details_entity.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';

class PerenualAPI {
  final String _authority = 'perenual.com';
  final _apiDirectory = '/api';
  final _speciesListPath = '/species-list';
  final _speciesDetailsPath = '/species/details';

  String get _apiKey {
    String apiKey = const String.fromEnvironment('PERENUAL_KEY');
    if (apiKey.isEmpty) {
      return '';
    }
    return apiKey;
  }

  Future<SpeciesEntity> speciesList(int page, {String search = ''}) async {
    Map<String, dynamic> params = {
      'page': page.toString(),
      'key': _apiKey,
    };
    if (search.isNotEmpty) {
      params['q'] = search;
    }
    Uri uri = Uri.https(_authority, _apiDirectory + _speciesListPath, params);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      return SpeciesEntity.fromJson(decodedJson);
    } else {
      Logger.error(
        'Response code for speciesList is not 200, actual code is ${response.statusCode}',
      );
      return const SpeciesEntity();
    }
  }

  Future<SpeciesDetailsEntity> speciesDetails(int id) async {
    Uri uri = Uri.https(_authority, '$_apiDirectory$_speciesDetailsPath/$id', {
      'key': _apiKey,
    });
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      return SpeciesDetailsEntity.fromJson(decodedJson);
    } else {
      Logger.error(
        'Response code for speciesDetails is not 200, actual code is ${response.statusCode}',
      );
      return const SpeciesDetailsEntity();
    }
  }
}
