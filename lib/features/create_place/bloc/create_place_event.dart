part of 'create_place_bloc.dart';

abstract class CreatePlaceEvent extends Equatable {
  const CreatePlaceEvent();
}

class PickImagesFromGalleryEvent extends CreatePlaceEvent {
  const PickImagesFromGalleryEvent();

  @override
  List<Object?> get props => [];
}

class DeleteImageFromSelectionEvent extends CreatePlaceEvent {
  const DeleteImageFromSelectionEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}

class NameChangedEvent extends CreatePlaceEvent {
  const NameChangedEvent({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [
        name,
      ];
}

class LatitudeChangedEvent extends CreatePlaceEvent {
  const LatitudeChangedEvent({
    required this.latitude,
  });

  final String latitude;

  @override
  List<Object?> get props => [
        latitude,
      ];
}

class LongitudeChangedEvent extends CreatePlaceEvent {
  const LongitudeChangedEvent({
    required this.longitude,
  });

  final String longitude;

  @override
  List<Object?> get props => [
        longitude,
      ];
}

class DescriptionChangedEvent extends CreatePlaceEvent {
  const DescriptionChangedEvent({
    required this.description,
  });

  final String description;

  @override
  List<Object?> get props => [
        description,
      ];
}

class SelectCategoryEvent extends CreatePlaceEvent {
  const SelectCategoryEvent({
    required this.context,
  });

  final BuildContext context;

  @override
  List<Object?> get props => [
        context,
      ];
}
