import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required PlaceRepository placeRepository,
    required PlaceFilters initialPlaceFilters,
    required List<int> initialSelectedIndexes,
  })  : _placeRepository = placeRepository,
        super(
          FilterState(
            placeFilters: initialPlaceFilters,
            selectedIndexes: initialSelectedIndexes,
          ),
        ) {
    _registerEventHandler();
    add(const FilterCountFilteredPlaces());
  }

  final PlaceRepository _placeRepository;

  void _registerEventHandler() {
    on<FilterEvent>(
      (event, emitter) async {
        switch (event) {
          case FilterCategorySelectedEvent():
            await _handleFilterCategorySelectedEvent(emitter, event);
          case FilterRangeChangedEvent():
            await _handleFilterRangeChangedEvent(emitter, event);
          case FilterCountFilteredPlaces():
            await _handleFilterCountFilteredPlaces(emitter, event);
          case FilterShowFilteredPlacesEvent():
            await _handleFilterShowFilteredPlacesEvent(emitter);
          case FilterClearFiltersEvent():
            await _handleFilterClearFiltersEvent(emitter);
        }
      },
    );
  }

  Future<void> _handleFilterCategorySelectedEvent(
    Emitter emitter,
    FilterCategorySelectedEvent event,
  ) async {
    final newSelectedCategories =
        state.placeFilters.selectedCategories.toList();
    final newSelectedIndexes = state.selectedIndexes?.toList() ?? [];

    if (newSelectedCategories.contains(
      PlaceCategory.values[event.selectedIndex],
    )) {
      newSelectedCategories.remove(
        PlaceCategory.values[event.selectedIndex],
      );
      newSelectedIndexes.remove(event.selectedIndex);
    } else {
      newSelectedCategories.add(
        PlaceCategory.values[event.selectedIndex],
      );
      newSelectedIndexes.add(event.selectedIndex);
    }

    emitter(
      state.copyWith(
        placeFilters: state.placeFilters.copyWith(
          selectedCategories: newSelectedCategories,
        ),
        selectedIndexes: newSelectedIndexes,
      ),
    );

    add(const FilterCountFilteredPlaces());
  }

  Future<void> _handleFilterRangeChangedEvent(
    Emitter emitter,
    FilterRangeChangedEvent event,
  ) async {}

  Future<void> _handleFilterCountFilteredPlaces(
    Emitter emitter,
    FilterCountFilteredPlaces event,
  ) async {
    final places = await _placeRepository.getPlacesFromStorage(
      categories: state.placeFilters.selectedCategories.isNotEmpty
          ? state.placeFilters.selectedCategories
              .map((e) => e.toString())
              .toList()
          : null,
    );

    final placesCount = places.length;

    emitter(
      state.copyWith(filteredPlacesCount: placesCount),
    );
  }

  Future<void> _handleFilterShowFilteredPlacesEvent(
    Emitter emitter,
  ) async {}

  Future<void> _handleFilterClearFiltersEvent(
    Emitter emitter,
  ) async {
    emitter(
      state.copyWith(
        placeFilters: const PlaceFilters.initial(),
        selectedIndexes: [],
      ),
    );
    add(const FilterCountFilteredPlaces());
  }
}
