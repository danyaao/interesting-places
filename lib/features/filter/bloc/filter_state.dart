part of 'filter_bloc.dart';

class FilterState extends Equatable {
  const FilterState({
    this.placeFilters = const PlaceFilters.initial(),
    this.filteredPlacesCount,
    this.selectedIndexes,
  });

  final PlaceFilters placeFilters;
  final int? filteredPlacesCount;
  final List<int>? selectedIndexes;

  FilterState copyWith({
    PlaceFilters? placeFilters,
    int? filteredPlacesCount,
    List<int>? selectedIndexes,
  }) {
    return FilterState(
      placeFilters: placeFilters ?? this.placeFilters,
      filteredPlacesCount: filteredPlacesCount ?? this.filteredPlacesCount,
      selectedIndexes: selectedIndexes ?? this.selectedIndexes,
    );
  }

  @override
  List<Object?> get props => [
        placeFilters,
        filteredPlacesCount,
        selectedIndexes,
      ];
}
