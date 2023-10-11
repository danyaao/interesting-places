import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/place_dm.dart';
import 'package:interesting_places/domain_models/place_filters.dart';
import 'package:interesting_places/features/create_place/create_place.dart';
import 'package:interesting_places/features/filter/ui/filter_screen.dart';
import 'package:interesting_places/features/place_list/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/ui/place_list_list_view.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({
    super.key,
    required this.placeRepository,
  });

  final PlaceRepository placeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PlaceRepository>(
      create: (context) => placeRepository,
      child: BlocProvider<PlaceListBloc>(
        create: (context) => PlaceListBloc(
          placeRepository: placeRepository,
        ),
        child: const PlaceListWidget(),
      ),
    );
  }
}

class PlaceListWidget extends StatefulWidget {
  const PlaceListWidget({
    super.key,
  });

  @override
  State<PlaceListWidget> createState() => _PlaceListWidgetState();
}

class _PlaceListWidgetState extends State<PlaceListWidget> {
  final TextEditingController searchBarController = TextEditingController();

  PlaceListBloc get _bloc => context.read<PlaceListBloc>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final colors = context.colors;

    return BlocBuilder<PlaceListBloc, PlaceListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.placeListAppBar),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
            child: Stack(
              children: [
                Column(
                  children: [
                    SearchForm(
                      controller: searchBarController,
                      onPressed: () async {
                        final placeFilters = await openFilterPlaceScreen(
                          placeRepository: context.read<PlaceRepository>(),
                          context: context,
                        );

                        _bloc.add(
                          PlaceListFilterEvent(
                            placeFilters: placeFilters,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _bloc.add(const PlaceListRefreshEvent());
                        },
                        child: switch (state) {
                          PlaceListSuccessState() => PlaceListListView(
                              places: state.places,
                            ),
                          PlaceListInitialState() => Center(
                              child: CircularProgressIndicator(
                                color: colors.darkest,
                              ),
                            ),
                          PlaceListFailureState() => Center(
                              child: Text(
                                l10n.somethingWentWrong,
                                style: TextStyle(
                                  color: colors.red,
                                ),
                              ),
                            ),
                        },
                      ),
                    ),
                  ],
                ),
                BottomFloatingButton(
                  label: l10n.newPlaceButton,
                  onPressed: () async {
                    final placeDM = await openCreatePlaceScreen(
                      placeRepository: context.read<PlaceRepository>(),
                      context: context,
                    );

                    _bloc.add(
                      PlaceListCreatePlaceEvent(
                        placeDM: placeDM,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<PlaceDM> openCreatePlaceScreen({
    required PlaceRepository placeRepository,
    required BuildContext context,
  }) async {
    final PlaceDM place = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePlaceScreen(
          placeRepository: placeRepository,
        ),
      ),
    );

    return place;
  }

  Future<PlaceFilters> openFilterPlaceScreen({
    required PlaceRepository placeRepository,
    required BuildContext context,
  }) async {
    final PlaceFilters places = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(placeRepository: placeRepository),
      ),
    );

    return places;
  }
}
