import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interesting_places/domain_models/place_dm.dart';
import 'package:interesting_places/domain_models/place_filters.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

part 'place_list_event.dart';

part 'place_list_state.dart';

class PlaceListBloc extends Bloc<PlaceListEvent, PlaceListState> {
  PlaceListBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(PlaceListInitialState()) {
    _registerEventHandler();
    add(const PlaceListRefreshEvent());
  }

  final PlaceRepository _placeRepository;

  void _registerEventHandler() {
    on<PlaceListEvent>((event, emitter) async {
      switch (event) {
        case PlaceListRefreshEvent():
          await _handlePlaceListRefreshEvent(emitter);
        case PlaceListCreatePlaceEvent():
          await _handlePlaceListCreatePlaceEvent(emitter, event);
        case PlaceListFilterEvent():
          await _handlePlaceListFilterEvent(emitter, event);
      }
    });
  }

  Future<void> _handlePlaceListRefreshEvent(
    Emitter emitter,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlaceListSuccessState) {
        final places =
            await _loadPlaces(placeFilters: currentState.placeFilters);

        emitter(currentState.copyWith(places: places));
      } else {
        final places = await _loadPlaces();

        emitter(PlaceListSuccessState(places: places));
      }
    } catch (e) {
      emitter(PlaceListFailureState());
      rethrow;
    }
  }

  Future<void> _handlePlaceListCreatePlaceEvent(
    Emitter emitter,
    PlaceListCreatePlaceEvent event,
  ) async {
    final currentState = state;

    final List<PlaceDM> newPlaces = [];

    switch (currentState) {
      case PlaceListSuccessState():
        newPlaces.addAll(currentState.places.toList());
        newPlaces.add(event.placeDM);
      default:
        newPlaces.add(event.placeDM);
    }

    emitter(
      PlaceListSuccessState(places: newPlaces),
    );
  }

  Future<void> _handlePlaceListFilterEvent(
    Emitter emitter,
    PlaceListFilterEvent event,
  ) async {
    final currentState = state;
    if (currentState is PlaceListSuccessState) {
      emitter(
        PlaceListSuccessState(
          places: currentState.places,
          placeFilters: event.placeFilters,
        ),
      );
    }

    add(const PlaceListRefreshEvent());
  }

  Future<List<PlaceDM>> _loadPlaces({
    PlaceFilters placeFilters = const PlaceFilters.clear(),
  }) async {
    final places = _placeRepository.getPlacesFromStorage(
        categories: placeFilters.selectedCategories);

    return places;
  }
}
