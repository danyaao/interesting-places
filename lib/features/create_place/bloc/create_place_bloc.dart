import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_places/domain_models/place_dm.dart';
import 'package:interesting_places/features/create_place/ui/select_category_screen.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

part 'create_place_event.dart';

part 'create_place_state.dart';

class CreatePlaceBloc extends Bloc<CreatePlaceEvent, CreatePlaceState> {
  CreatePlaceBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(CreatePlaceState()) {
    _registerEventHandler();
  }

  final PlaceRepository _placeRepository;

  void _registerEventHandler() {
    on<CreatePlaceEvent>(
      (event, emitter) async {
        switch (event) {
          case PickImagesFromGalleryEvent():
            await _handlePickImagesFromGalleryEvent(emitter);
          case DeleteImageFromSelectionEvent():
            await _handleDeleteImageFromSelectionEvent(emitter, event);
          case NameChangedEvent():
            await _handleNameChangedEvent(emitter, event);
          case LatitudeChangedEvent():
            await _handleLatitudeChangedEvent(emitter, event);
          case LongitudeChangedEvent():
            await _handleLongitudeChangedEvent(emitter, event);
          case SelectCategoryEvent():
            await _handleSelectCategoryEvent(emitter, event);
          case SavePlaceEvent():
            await _handleSavePlaceEvent(emitter, event);
        }
      },
    );
  }

  Future<void> _handlePickImagesFromGalleryEvent(
    Emitter emitter,
  ) async {
    final newImages = await _getImageFromGallery();
    newImages.addAll(state.images ?? []);

    emitter(state.copyWith(
      images: newImages,
    ));
  }

  Future<void> _handleDeleteImageFromSelectionEvent(
    Emitter emitter,
    DeleteImageFromSelectionEvent event,
  ) async {
    final newImages = state.images!.toList();
    newImages.removeAt(event.index);

    emitter(state.copyWith(
      images: newImages,
    ));
  }

  Future<void> _handleNameChangedEvent(
    Emitter emitter,
    NameChangedEvent event,
  ) async {
    if (event.name.length < 3) {
      emitter(state.copyWith(
        isNameValid: false,
      ));
    } else {
      emitter(state.copyWith(
        name: event.name,
        isNameValid: true,
      ));
    }
  }

  Future<void> _handleLatitudeChangedEvent(
    Emitter emitter,
    LatitudeChangedEvent event,
  ) async {
    if (double.tryParse(event.latitude) == null) {
      emitter(state.copyWith(
        isLatitudeValid: false,
      ));
    } else {
      emitter(state.copyWith(
        latitude: event.latitude,
        isLatitudeValid: true,
      ));
    }
  }

  Future<void> _handleLongitudeChangedEvent(
    Emitter emitter,
    LongitudeChangedEvent event,
  ) async {
    if (double.tryParse(event.longitude) == null) {
      emitter(state.copyWith(
        isLongitudeValid: false,
      ));
    } else {
      emitter(state.copyWith(
        latitude: event.longitude,
        isLongitudeValid: true,
      ));
    }
  }

  Future<void> _handleSelectCategoryEvent(
    Emitter emitter,
    SelectCategoryEvent event,
  ) async {
    final context = event.context;
    final selectedCategory = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectCategoryScreen()),
    );

    emitter(state.copyWith(
      category: selectedCategory,
    ));
  }

  Future<void> _handleSavePlaceEvent(
    Emitter emitter,
    SavePlaceEvent event,
  ) async {
    try {
      final placeDM = PlaceDM(
        name: state.name!,
        category: state.category!,
        description: state.description,
        latitude: double.tryParse(state.latitude ?? '0')!,
        longitude: double.tryParse(state.longitude ?? '0')!,
        images: state.images!,
      );

      await _placeRepository.insertPlace(placeDM);

      emitter(state.copyWith(placeDM: placeDM));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Uint8List>> _getImageFromGallery() async {
    final xFiles = await ImagePicker().pickMultiImage();
    final images = xFiles.map((e) => File(e.path).readAsBytesSync()).toList();

    return images;
  }
}
