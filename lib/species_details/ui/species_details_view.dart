import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  const SpeciesDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedSpeciesId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text(
          'Plant Details 🌺',
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
                CachedNetworkImage(
                  imageUrl: speciesDetails.defaultImage.regularUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: MediaQuery.of(context).size.height / 2.3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
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
                        title: 'Description',
                        details: speciesDetails.description,
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
                      ),
                      TitleWithDetailsView(
                        title: 'Cycle',
                        details: speciesDetails.cycle,
                      ),
                      TitleWithListView(
                        title: 'Attracts',
                        list: speciesDetails.attracts,
                      ),
                      TitleWithListView(
                        title: 'Propagation',
                        list: speciesDetails.propagation,
                      ),
                      HardinessView(
                        title: 'Hardiness',
                        hardiness: speciesDetails.hardiness,
                      ),
                      TitleWithDetailsView(
                        title: 'Watering',
                        details: speciesDetails.watering,
                      ),
                      TitleWithDetailsView(
                        title: 'Watering Period',
                        details: speciesDetails.wateringPeriod,
                      ),
                      WateringGeneralBenchmarkView(
                        title: 'Watering General Benchmark',
                        wateringGeneralBenchmark:
                        speciesDetails.wateringGeneralBenchmark,
                      ),
                      TitleWithListView(
                        title: 'Sunlight',
                        list: speciesDetails.sunlight,
                      ),
                      TitleWithListView(
                        title: 'Pruning Month',
                        list: speciesDetails.pruningMonth,
                      ),
                      TitleWithDetailsView(
                        title: 'Care Guide URI',
                        details: speciesDetails.careGuideUri,
                      ),
                      TitleWithDetailsView(
                        title: 'Growth Rate',
                        details: speciesDetails.growthRate,
                      ),
                      TitleWithDetailsView(
                        title: 'Drought Tolerant',
                        details: speciesDetails.droughtTolerant.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Salt Tolerant',
                        details: speciesDetails.saltTolerant.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Thorny',
                        details: speciesDetails.thorny.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Invasive',
                        details: speciesDetails.invasive.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Tropical',
                        details: speciesDetails.tropical.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Indoor',
                        details: speciesDetails.indoor.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Care Level',
                        details: speciesDetails.careLevel,
                      ),
                      TitleWithDetailsView(
                        title: 'Flowers',
                        details: speciesDetails.flowers.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Cones',
                        details: speciesDetails.cones.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Fruits',
                        details: speciesDetails.fruits.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Edible Fruit',
                        details: speciesDetails.edibleFruit.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Leaf',
                        details: speciesDetails.leaf.toString(),
                      ),
                      TitleWithListView(
                        title: 'Leaf Color',
                        list: speciesDetails.leafColor,
                      ),
                      TitleWithDetailsView(
                        title: 'Edible Leaf',
                        details: speciesDetails.edibleLeaf.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Cuisine',
                        details: speciesDetails.cuisine.toString(),
                      ),
                      TitleWithDetailsView(
                        title: 'Medicinal',
                        details: speciesDetails.medicinal.toString(),
                      ),
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

class SectionTitleWidget extends StatelessWidget {
  final String _title;

  const SectionTitleWidget(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: const TextStyle(fontStyle: FontStyle.italic),
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
  })
      : _title = title,
        _details = details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(_title),
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
  })
      : _title = title,
        _list = list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(_title),
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
  })
      : _title = title,
        _dimensions = dimensions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(_title),
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

class HardinessView extends StatelessWidget {
  final String _title;
  final Hardiness _hardiness;

  const HardinessView({
    required String title,
    required Hardiness hardiness,
    super.key,
  })
      : _title = title,
        _hardiness = hardiness;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(_title),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 5,
          ),
          child: Column(
            children: [
              TitleWithDetailsView(
                title: 'Min',
                details: _hardiness.min.toString(),
              ),
              TitleWithDetailsView(
                title: 'Max',
                details: _hardiness.max.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WateringGeneralBenchmarkView extends StatelessWidget {
  final String _title;
  final WateringGeneralBenchmark _wateringGeneralBenchmark;

  const WateringGeneralBenchmarkView({
    required String title,
    required WateringGeneralBenchmark wateringGeneralBenchmark,
    super.key,
  })
      : _title = title,
        _wateringGeneralBenchmark = wateringGeneralBenchmark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(_title),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 5,
          ),
          child: Column(
            children: [
              TitleWithDetailsView(
                title: 'Value',
                details: _wateringGeneralBenchmark.value.toString(),
              ),
              TitleWithDetailsView(
                title: 'Unit',
                details: _wateringGeneralBenchmark.unit.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
