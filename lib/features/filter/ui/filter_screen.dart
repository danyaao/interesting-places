import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/place_filters.dart';
import 'package:interesting_places/features/filter/bloc/filter_bloc.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({
    super.key,
    required this.placeRepository,
    required this.placeFilters,
    required this.selectedIndexes,
  });

  final PlaceRepository placeRepository;
  final PlaceFilters placeFilters;
  final List<int> selectedIndexes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(
        placeRepository: placeRepository,
        initialPlaceFilters: placeFilters,
        initialSelectedIndexes: selectedIndexes,
      ),
      child: const FilterWidget(),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  FilterBloc get _bloc => context.read<FilterBloc>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final colors = context.colors;
    final categories = l10n.categories.split(';');

    final List<(IconData, String)> items = [
      (Icons.movie_outlined, categories[0]),
      (Icons.restaurant, categories[1]),
      (Icons.star_outline, categories[2]),
      (Icons.theater_comedy_outlined, categories[3]),
      (Icons.museum_outlined, categories[4]),
      (Icons.local_cafe_outlined, categories[5]),
    ];

    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _bloc.add(const FilterClearFiltersEvent());
                  },
                  child: Text(
                    l10n.clearButton,
                    style: text.text.copyWith(
                      color: colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),
                FilterGrid(
                  items: items,
                  selectedIndexes: state.selectedIndexes ?? [],
                  name: l10n.categoriesGridView,
                  onTap: (index) {
                    _bloc.add(
                      FilterCategorySelectedEvent(
                        selectedIndex: index,
                        categories: categories,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 56),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(l10n.rangeSlider),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          l10n.fromToSlider,
                          style: text.text.copyWith(
                            color: colors.grey,
                          ),
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: RangeValues(
                        state.placeFilters.rangeValues.$1,
                        state.placeFilters.rangeValues.$2,
                      ),
                      min: 10,
                      max: 30,
                      divisions: 1,
                      onChanged: (rangeValues) {
                        _bloc.add(
                          FilterRangeChangedEvent(
                            newRange: (rangeValues.start, rangeValues.start),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                BottomButton(
                  onPressed: () {
                    final placeFilters = state.placeFilters;
                    final selectedIndexes = state.selectedIndexes;

                    closeFilterScreen(
                      placeFilters: placeFilters,
                      selectedIndexes: selectedIndexes ?? [],
                      context: context,
                    );
                  },
                  label: state.filteredPlacesCount != null
                      ? '${l10n.showButton} (${state.filteredPlacesCount})'
                      : l10n.showButton,
                  isActive: true,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void closeFilterScreen({
    required PlaceFilters placeFilters,
    required List<int> selectedIndexes,
    required BuildContext context,
  }) {
    Navigator.pop(context, (placeFilters, selectedIndexes));
  }
}
