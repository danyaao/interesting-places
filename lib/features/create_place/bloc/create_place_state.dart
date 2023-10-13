part of 'create_place_bloc.dart';

sealed class CreatePlaceState extends Equatable {}

class CreatePlaceInProgressState extends CreatePlaceState {
  CreatePlaceInProgressState({
    this.name,
    this.isNameValid,
    this.category,
    this.description,
    this.latitude,
    this.isLatitudeValid,
    this.longitude,
    this.isLongitudeValid,
    this.images,
  }) : canCreate = (images?.isNotEmpty ?? false) &&
            (isNameValid ?? false) &&
            (isLatitudeValid ?? false) &&
            (isLongitudeValid ?? false) &&
            (category != null);

  final String? name;
  final bool? isNameValid;
  final PlaceCategory? category;
  final String? description;
  final String? latitude;
  final bool? isLatitudeValid;
  final String? longitude;
  final bool? isLongitudeValid;
  final List<Uint8List>? images;
  final bool? canCreate;

  CreatePlaceInProgressState copyWith({
    String? name,
    bool? isNameValid,
    PlaceCategory? category,
    String? description,
    String? latitude,
    bool? isLatitudeValid,
    String? longitude,
    bool? isLongitudeValid,
    List<Uint8List>? images,
  }) {
    return CreatePlaceInProgressState(
      name: name ?? this.name,
      isNameValid: isNameValid ?? this.isNameValid,
      category: category ?? this.category,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      isLatitudeValid: isLatitudeValid ?? this.isLatitudeValid,
      longitude: longitude ?? this.longitude,
      isLongitudeValid: isLongitudeValid ?? this.isLongitudeValid,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [
        name,
        isNameValid,
        category,
        description,
        latitude,
        isLatitudeValid,
        longitude,
        isLongitudeValid,
        canCreate,
        images,
      ];
}

class CreatePlaceSuccessState extends CreatePlaceState {
  CreatePlaceSuccessState({
    required this.place,
  });

  final Place place;

  @override
  List<Object?> get props => [
        place,
      ];
}
