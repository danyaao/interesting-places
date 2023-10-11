import 'package:equatable/equatable.dart';

class PlaceFilters extends Equatable {
  const PlaceFilters({
    required this.selectedCategories,
    required this.rangeValues,
  });

  final List<String> selectedCategories;
  final (double, double) rangeValues;

  bool get isFiltering =>
      selectedCategories.isNotEmpty ||
      rangeValues.$1 != 10 ||
      rangeValues.$2 != 30;

  PlaceFilters copyWith({
    List<String>? selectedCategories,
    (double, double)? rangeValues,
  }) {
    return PlaceFilters(
        selectedCategories: selectedCategories ?? this.selectedCategories,
        rangeValues: rangeValues ?? this.rangeValues);
  }

  const PlaceFilters.clear()
      : selectedCategories = const [],
        rangeValues = (10, 30);

  @override
  List<Object?> get props => [
        selectedCategories,
        rangeValues,
      ];
}
