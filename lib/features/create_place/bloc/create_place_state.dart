part of 'create_place_bloc.dart';

class CreatePlaceState extends Equatable {
  const CreatePlaceState({
    this.images,
    this.name,
    this.latitude,
    this.longitude,
    this.category,
  });

  final List<String>? images;
  final String? name;
  final String? latitude;
  final String? longitude;
  final Category? category;
  final bool canSave = false;

  CreatePlaceState copyWith({
    List<String>? images,
    String? name,
    String? latitude,
    String? longitude,
    Category? category,
  }) {
    return CreatePlaceState(
      images: images ?? this.images,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        images,
        name,
        latitude,
        longitude,
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
