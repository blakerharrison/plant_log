import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_log/api/logger/logger.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/species_details_entity.dart';

var selectedSpeciesId = Provider<int>((ref) {
  Logger.error('NO SPECIES ID');
  throw UnimplementedError();
});

final speciesDetailsEntityProvider = FutureProvider.autoDispose
    .family<SpeciesDetailsEntity, int>((ref, id) async {
  var entity = await PerenualAPI().speciesDetails(id);
  return entity;
});

class SpeciesDetailsView extends HookConsumerWidget {
  const SpeciesDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedSpeciesId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Plant Details 3:<',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ref.watch(speciesDetailsEntityProvider(id)).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('$err'),
            data: (speciesDetails) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.network(
                        speciesDetails.defaultImage.regularUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWithDetailsView(
                            title: 'Common Name',
                            details: speciesDetails.commonName,
                          ),
                          TitleWithListView(
                            title: 'Scientific Name',
                            list: speciesDetails.scientificName,
                          ),
                          TitleWithListView(
                            title: 'Other Name',
                            list: speciesDetails.otherName,
                          ),
                          TitleWithDetailsView(
                            title: 'Family',
                            details: speciesDetails.family,
                          ),
                          TitleWithListView(
                            title: 'Origin',
                            list: speciesDetails.origin,
                          ),
                          TitleWithDetailsView(
                            title: 'Type',
                            details: speciesDetails.type,
                          ),
                          TitleWithDimensionsView(
                            title: 'Dimensions',
                            dimensions: speciesDetails.dimensions,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}

class TitleWithDetailsView extends StatelessWidget {
  final String _title;
  final String _details;

  const TitleWithDetailsView({
    required String title,
    required String details,
    super.key,
  })  : _title = title,
        _details = details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 5,
          ),
          child: Text(_details),
        ),
      ],
    );
  }
}

class TitleWithListView extends StatelessWidget {
  final String _title;
  final List<String> _list;

  const TitleWithListView({
    required String title,
    required List<String> list,
    super.key,
  })  : _title = title,
        _list = list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              _list.length,
              (index) => Text(_list[index]),
            ),
          ),
        ),
      ],
    );
  }
}


// Optimize
//
class TitleWithDimensionsView extends StatelessWidget {
  final String _title;
  final Dimensions _dimensions;

  const TitleWithDimensionsView({
    required String title,
    required Dimensions dimensions,
    super.key,
  })  : _title = title,
        _dimensions = dimensions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 5,
          ),
          child: Column(
            children: [
              TitleWithDetailsView(
                title: 'Type',
                details: _dimensions.type,
              ),
              TitleWithDetailsView(
                title: 'Min',
                details: _dimensions.minValue.toString(),
              ),
              TitleWithDetailsView(
                title: 'Max',
                details: _dimensions.maxValue.toString(),
              ),
              TitleWithDetailsView(
                title: 'Unit',
                details: _dimensions.unit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
