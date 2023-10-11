part of 'create_place_bloc.dart';

class CreatePlaceState extends Equatable {
  CreatePlaceState({
    this.name,
    this.isNameValid,
    this.category,
    this.description,
    this.latitude,
    this.isLatitudeValid,
    this.longitude,
    this.isLongitudeValid,
    this.images,
    this.placeDM,
  }) : canCreate = (images?.isNotEmpty ?? false) &&
            (isNameValid ?? false) &&
            (isLatitudeValid ?? false) &&
            (isLongitudeValid ?? false) &&
            (category?.isNotEmpty ?? false);

  final String? name;
  final bool? isNameValid;
  final String? category;
  final String? description;
  final String? latitude;
  final bool? isLatitudeValid;
  final String? longitude;
  final bool? isLongitudeValid;
  final List<Uint8List>? images;
  final bool? canCreate;
  final PlaceDM? placeDM;

  CreatePlaceState copyWith({
    String? name,
    bool? isNameValid,
    String? category,
    String? description,
    String? latitude,
    bool? isLatitudeValid,
    String? longitude,
    bool? isLongitudeValid,
    List<Uint8List>? images,
    PlaceDM? placeDM,
  }) {
    return CreatePlaceState(
      name: name ?? this.name,
      isNameValid: isNameValid ?? this.isNameValid,
      category: category ?? this.category,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      isLatitudeValid: isLatitudeValid ?? this.isLatitudeValid,
      longitude: longitude ?? this.longitude,
      isLongitudeValid: isLongitudeValid ?? this.isLongitudeValid,
      images: images ?? this.images,
      placeDM: placeDM ?? this.placeDM,
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
        placeDM,
      ];
}
