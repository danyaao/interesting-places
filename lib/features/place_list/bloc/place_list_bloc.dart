import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/domain_models/place_dm.dart';
import 'package:interesting_places/features/create_place/create_place.dart';
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
      }
    });
  }

  Future<void> _handlePlaceListRefreshEvent(
    Emitter emitter,
  ) async {
    try {
      final places = await _loadPlaces();
      emitter(PlaceListSuccessState(places: places));
    } catch (e) {
      emitter(PlaceListFailureState());
      rethrow;
    }
  }

  Future<void> _handlePlaceListCreatePlaceEvent(
    Emitter emitter,
    PlaceListCreatePlaceEvent event,
  ) async {
    await Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) =>
            CreatePlaceScreen(placeRepository: _placeRepository),
      ),
    );

    add(const PlaceListRefreshEvent());
  }

  Future<List<PlaceDM>> _loadPlaces() async {
    final places = _placeRepository.getPlacesFromStorage();

    return places;
  }
}
