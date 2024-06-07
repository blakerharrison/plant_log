import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/features/home/model/home_view_model.dart';
import 'package:plant_log/features/home/state/home_state.dart';
import 'package:plant_log/features/home/ui/home_presenter.dart';

// TODO: Decouple this from HomeViewModel.
class PlantSearchScreen extends StatelessWidget {
  const PlantSearchScreen({
    super.key,
    required this.homeViewModel,
    required this.presenter,
    required this.ref,
  });

  final HomeViewModel homeViewModel;
  final HomePresenter presenter;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Center(
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
          )
        ],
      ),
    );
  }
}