import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/features/home/model/home_view_model.dart';
import 'package:plant_log/features/home/state/home_state.dart';
import 'package:plant_log/features/home/ui/home_presenter.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';

// TODO: Decouple this from HomeViewModel.
class PlantSearchScreen extends StatelessWidget {
  PlantSearchScreen({
    super.key,
    required this.homeViewModel,
    required this.presenter,
    required this.ref,
  });

  final TextEditingController _textEditingController = TextEditingController();
  final HomeViewModel homeViewModel;
  final HomePresenter presenter;
  final WidgetRef ref;
  final double _plantThumbnailDimension = 50;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          if (homeViewModel.searchIsLoading &&
              homeViewModel.searchResult.data.isEmpty)
            const Expanded(
              child: LoadingIndicator(showBackground: false),
            ),
          if (homeViewModel.searchResult.data.isEmpty &&
              _textEditingController.text.isNotEmpty)
            const Expanded(
              child: Text('No Results Found'),
            ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Search Plants',
                    onChanged: ref.read(homeViewModelProvider.notifier).search,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        homeViewModel.searchResult.data.length,
                        (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: CachedNetworkImage(
                                  imageUrl: homeViewModel.searchResult.data[index]
                                      .defaultImage.thumbnail,
                                  height: _plantThumbnailDimension,
                                  width: _plantThumbnailDimension,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) => Center(
                                    child: SizedBox(
                                      height: _plantThumbnailDimension,
                                      width: _plantThumbnailDimension,
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  homeViewModel
                                      .searchResult.data[index].commonName,
                                ),
                                subtitle: Text(
                                  homeViewModel
                                      .searchResult.data[index].scientificName[0],
                                ),
                                onTap: () => _resultTap(
                                  context,
                                  id: homeViewModel.searchResult.data[index].id,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _resultTap(BuildContext context, {required int id}) {
    presenter.navigateToSpeciesDetails(context, id: id);
  }
}
