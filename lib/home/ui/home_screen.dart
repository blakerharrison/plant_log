import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/home/model/home_view_model.dart';
import 'package:plant_log/home/state/home_state.dart';
import 'package:plant_log/home/ui/home_presenter.dart';
import 'package:plant_log/login/ui/login_screen.dart';
import 'package:plant_log/login/ui/login_widget.dart';
import 'package:plant_log/search/ui/plant_search_screen.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';

class HomeScreen extends ConsumerWidget {
  final HomePresenter presenter;
  final ScrollController _scrollController = ScrollController();

  HomeScreen({
    super.key,
    HomePresenter? homePresenter,
  }) : presenter = homePresenter ?? HomePresenter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeViewModel homeViewModel = ref.watch(homeViewModelProvider);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels +
              MediaQuery.of(context).size.height >=
          _scrollController.position.maxScrollExtent) {
        ref.read(homeViewModelProvider.notifier).fetchMoreSpeciesData();
      }
    });
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'Plant Log 🌵',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: ref.read(homeViewModelProvider.notifier).toggleSearch,
              icon: Icon(homeViewModel.showSearch ? Icons.close : Icons.search),
            )
          ],
        ),
        body: homeViewModel.showSearch
            ? PlantSearchScreen(
                homeViewModel: homeViewModel,
                presenter: presenter,
                ref: ref,
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    child: HomePlantListWidget(
                        homeViewModel: homeViewModel, presenter: presenter),
                  ),
                  Center(
                    child: Visibility(
                      visible: homeViewModel.showLoginWidget,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        opacity: homeViewModel.showLoginWidget ? 1 : 0,
                        child: LoginWidget(
                          closeButtonCallback: ref
                              .read(homeViewModelProvider.notifier)
                              .toggleLoginWidget,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        floatingActionButton: homeViewModel.showLoginWidget
            ? null
            : FloatingActionButton(
                onPressed: () => navigateToLogin(context, ref),
                backgroundColor: Colors.green,
                child: Icon(
                  (authClient.currentUser() == null) ? Icons.key : Icons.person,
                ),
              ),
      ),
    );
  }

  void navigateToLogin(BuildContext context, WidgetRef ref) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => LoginScreen(
        loginSuccessCallback: () => loginScreenCallback(context, ref),
      ),
      isScrollControlled: true,
    );
  }

  void loginScreenCallback(BuildContext context, WidgetRef ref) {
    Navigator.pop(context);
    ref.read(homeViewModelProvider.notifier).toggleLoginWidget();
  }
}

class HomePlantListWidget extends StatelessWidget {
  const HomePlantListWidget({
    super.key,
    required this.homeViewModel,
    required this.presenter,
  });

  final HomeViewModel homeViewModel;
  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: List.generate(
          homeViewModel.speciesEntity.data.length,
          (index) => GestureDetector(
            onTap: () {
              presenter.navigateToSpeciesDetails(
                context,
                id: homeViewModel.speciesEntity.data[index].id,
              );
            },
            child: Stack(
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: homeViewModel
                        .speciesEntity.data[index].defaultImage.regularUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: LoadingIndicator(
                          showBackground: false,
                          enableDark: true,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
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
                          homeViewModel.speciesEntity.data[index].commonName,
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
    );
  }
}
