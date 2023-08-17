import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_log/api/logger/logger.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/plant_details_entity.dart';

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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
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
                    const Text('Common Name'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(speciesDetails.commonName),
                    ),
                  ],
                ),
              ),
                ],
              );
            },
          ),
    );
  }
}
