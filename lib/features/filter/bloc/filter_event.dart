part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class FilterCategorySelectedEvent extends FilterEvent {
  const FilterCategorySelectedEvent({
    required this.selectedIndex,
    required this.categories,
  });

  final int selectedIndex;
  final List<String> categories;

  @override
  List<Object?> get props => [
        selectedIndex,
        categories,
      ];
}

class FilterRangeChangedEvent extends FilterEvent {
  const FilterRangeChangedEvent({
    required this.newRange,
  });

  final (double, double) newRange;

  @override
  List<Object?> get props => [
        newRange,
      ];
}

class FilterCountFilteredPlaces extends FilterEvent {
  const FilterCountFilteredPlaces();

  @override
  List<Object?> get props => [];
}

class FilterShowFilteredPlacesEvent extends FilterEvent {
  const FilterShowFilteredPlacesEvent();

  @override
  List<Object?> get props => [];
}

class FilterClearFiltersEvent extends FilterEvent {
  const FilterClearFiltersEvent();

  @override
  List<Object?> get props => [];
}
