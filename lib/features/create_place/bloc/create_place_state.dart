part of 'create_place_bloc.dart';

class CreatePlaceState extends Equatable {
  CreatePlaceState({
    this.images,
    this.name,
    this.isNameValid,
    this.latitude,
    this.isLatitudeValid,
    this.longitude,
    this.isLongitudeValid,
    this.category,
  }) : canCreate = (images?.isNotEmpty ?? false) &&
            (isNameValid ?? false) &&
            (isLatitudeValid ?? false) &&
            (isLongitudeValid ?? false) &&
            (category?.isNotEmpty ?? false);

  final List<String>? images;
  final String? name;
  final bool? isNameValid;
  final String? latitude;
  final bool? isLatitudeValid;
  final String? longitude;
  final bool? isLongitudeValid;
  final String? category;
  final bool? canCreate;

  CreatePlaceState copyWith({
    List<String>? images,
    String? name,
    bool? isNameValid,
    String? latitude,
    bool? isLatitudeValid,
    String? longitude,
    bool? isLongitudeValid,
    String? category,
  }) {
    return CreatePlaceState(
      images: images ?? this.images,
      name: name ?? this.name,
      isNameValid: isNameValid ?? this.isNameValid,
      latitude: latitude ?? this.latitude,
      isLatitudeValid: isLatitudeValid ?? this.isLatitudeValid,
      longitude: longitude ?? this.longitude,
      isLongitudeValid: isLongitudeValid ?? this.isLongitudeValid,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        images,
        name,
        isNameValid,
        latitude,
        isLatitudeValid,
        longitude,
        isLongitudeValid,
        category,
        canCreate,
      ];
}
