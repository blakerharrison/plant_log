import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/perenual/api/perenual_api.dart';
import 'package:plant_log/api/perenual/models/species_entity.dart';
import 'package:plant_log/features/home/model/home_view_model.dart';

final homeViewModelProvider = StateNotifierProvider<HomeState, HomeViewModel>(
  (ref) => HomeState(),
);

class HomeState extends StateNotifier<HomeViewModel> {
  final PerenualAPI perenualAPI;
  final Debouncer _debouncer = Debouncer();
  int page = 0;
  bool isLoading = false;
  bool showSearch = false;
  bool showLoginWidget = false;

  HomeState({PerenualAPI? perenualAPI})
      : perenualAPI = perenualAPI ?? PerenualAPI(),
        super(const HomeViewModel()) {
    fetchMoreSpeciesData();
  }

  void fetchMoreSpeciesData() async {
    if (isLoading) return;
    isLoading = true;
    SpeciesEntity speciesEntity = await perenualAPI.speciesList(page);
    if (speciesEntity.data.isNotEmpty) {
      state = HomeViewModel(
        speciesEntity: SpeciesEntity(
          data: [...state.speciesEntity.data, ...speciesEntity.data],
        ),
      );
      page++;
    }
    isLoading = false;
  }

  void cacheSelectedPlant(SpeciesDataEntity entity) {
    // Repository.cache(entity as Entity);
  }

  void toggleSearch() {
    state = HomeViewModel(
      speciesEntity: state.speciesEntity,
      showSearch: !state.showSearch,
      showLoginWidget: state.showLoginWidget,
    );
  }

  void search(String query) {
    if (query.isEmpty) { return; }
    showSearchLoading();
    const duration = Duration(milliseconds: 500);
    final q = query.replaceAll(" ", "_");
    const page = 1;

    _debouncer.debounce(
      duration: duration,
      onDebounce: () async {
        SpeciesEntity searchResult = await perenualAPI.speciesList(
          page,
          search: q,
        );
        state = HomeViewModel(
          speciesEntity: state.speciesEntity,
          showSearch: true,
          showLoginWidget: false,
          searchResult: SpeciesEntity(
            data: searchResult.data,
          ),
          searchIsLoading: false,
        );
      },
    );
  }

  void showSearchLoading() {
    state = HomeViewModel(
      speciesEntity: state.speciesEntity,
      showSearch: true,
      showLoginWidget: false,
      searchResult: state.searchResult,
      searchIsLoading: true,
    );
  }

  void toggleLoginWidget() {
    state = HomeViewModel(
      speciesEntity: state.speciesEntity,
      showSearch: state.showSearch,
      showLoginWidget: !state.showLoginWidget,
    );
  }
}
