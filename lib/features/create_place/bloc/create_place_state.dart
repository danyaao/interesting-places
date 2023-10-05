part of 'create_place_bloc.dart';

class CreatePlaceState extends Equatable {
  const CreatePlaceState({
    this.images,
    this.name,
    this.isNameValid,
    this.latitude,
    this.isLatitudeValid,
    this.longitude,
    this.isLongitudeValid,
    this.category,
  });

  final List<String>? images;
  final String? name;
  final bool? isNameValid;
  final String? latitude;
  final bool? isLatitudeValid;
  final String? longitude;
  final bool? isLongitudeValid;
  final Category? category;
  final bool canSave = false;

  CreatePlaceState copyWith({
    List<String>? images,
    String? name,
    bool? isNameValid,
    String? latitude,
    bool? isLatitudeValid,
    String? longitude,
    bool? isLongitudeValid,
    Category? category,
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
        canSave,
      ];
}

enum Category {
  cinema,
  restaurant,
  specialPlace,
  theatre,
  museum,
  cafe,
}
