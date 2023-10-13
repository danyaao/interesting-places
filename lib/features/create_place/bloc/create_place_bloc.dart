import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

part 'create_place_event.dart';

part 'create_place_state.dart';

class CreatePlaceBloc extends Bloc<CreatePlaceEvent, CreatePlaceState> {
  CreatePlaceBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(CreatePlaceInProgressState()) {
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
          case DescriptionChangedEvent():
            await _handleDescriptionChangedEvent(emitter, event);
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
    final currentState = state;

    final newImages = await _getImagesFromGallery();

    if (currentState is CreatePlaceInProgressState) {
      final images = currentState.images?.toList() ?? [];
      images.addAll(newImages);

      emitter(currentState.copyWith(
        images: images,
      ));
    }
  }

  Future<void> _handleDeleteImageFromSelectionEvent(
    Emitter emitter,
    DeleteImageFromSelectionEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      final newImages = currentState.images!.toList();

      newImages.removeAt(event.index);

      emitter(currentState.copyWith(
        images: newImages,
      ));
    }
  }

  Future<void> _handleNameChangedEvent(
    Emitter emitter,
    NameChangedEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      if (event.name.length < 3) {
        emitter(currentState.copyWith(
          isNameValid: false,
        ));
      } else {
        emitter(currentState.copyWith(
          name: event.name,
          isNameValid: true,
        ));
      }
    }
  }

  Future<void> _handleDescriptionChangedEvent(
    Emitter emitter,
    DescriptionChangedEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      emitter(currentState.copyWith(description: event.description));
    }
  }

  Future<void> _handleLatitudeChangedEvent(
    Emitter emitter,
    LatitudeChangedEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      if (double.tryParse(event.latitude) == null) {
        emitter(currentState.copyWith(
          isLatitudeValid: false,
        ));
      } else {
        emitter(currentState.copyWith(
          latitude: event.latitude,
          isLatitudeValid: true,
        ));
      }
    }
  }

  Future<void> _handleLongitudeChangedEvent(
    Emitter emitter,
    LongitudeChangedEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      if (double.tryParse(event.longitude) == null) {
        emitter(currentState.copyWith(
          isLongitudeValid: false,
        ));
      } else {
        emitter(currentState.copyWith(
          longitude: event.longitude,
          isLongitudeValid: true,
        ));
      }
    }
  }

  Future<void> _handleSelectCategoryEvent(
    Emitter emitter,
    SelectCategoryEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      emitter(currentState.copyWith(
        category: event.selectedCategory,
      ));
    }
  }

  Future<void> _handleSavePlaceEvent(
    Emitter emitter,
    SavePlaceEvent event,
  ) async {
    final currentState = state;

    if (currentState is CreatePlaceInProgressState) {
      final currentName = currentState.name;
      final currentCategory = currentState.category;
      final currentLatitude = currentState.latitude;
      final currentLongitude = currentState.longitude;
      final currentImages = currentState.images;

      if (currentName != null &&
          currentCategory != null &&
          currentLatitude != null &&
          double.tryParse(currentLatitude) != null &&
          currentLongitude != null &&
          double.tryParse(currentLongitude) != null &&
          currentImages != null &&
          currentImages.isNotEmpty) {
        final place = Place(
          name: currentName,
          category: currentCategory,
          description: currentState.description ?? '',
          latitude: double.tryParse(currentLatitude)!,
          longitude: double.tryParse(currentLongitude)!,
          images: currentImages,
        );

        await _placeRepository.insertPlace(place);

        emitter(
          CreatePlaceSuccessState(place: place),
        );
      }
    }
  }

  Future<List<Uint8List>> _getImagesFromGallery() async {
    final xFiles = await ImagePicker().pickMultiImage();
    final images = xFiles.map((e) => File(e.path).readAsBytesSync()).toList();

    return images;
  }
}
