part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class FilterCategorySelectedEvent extends FilterEvent {
  const FilterCategorySelectedEvent({
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  List<Object?> get props => [
        selectedIndex,
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
