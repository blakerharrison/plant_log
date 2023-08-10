import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/species_entity.dart';
import 'package:plant_log/home/home_provider.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SpeciesEntity speciesEntity = ref.watch(speciesViewModelProvider);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels +
              MediaQuery.of(context).size.height >=
          _scrollController.position.maxScrollExtent) {
        ref.read(speciesViewModelProvider.notifier).fetchMoreSpeciesData();
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Plant Log :3',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        child: Center(
          child: Column(
            children: List.generate(
              speciesEntity.data.length,
              (index) => Stack(
                children: [
                  Center(
                    child: Image.network(
                      speciesEntity.data[index].defaultImage.originalUrl,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      errorBuilder: (context, error, stackTrace) => SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        width: 200,
                        child: const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            speciesEntity.data[index].commonName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
