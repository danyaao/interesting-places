import 'package:equatable/equatable.dart';
import 'package:interesting_places/domain_models/domain_models.dart';

class PlaceFilters extends Equatable {
  const PlaceFilters({
    required this.selectedCategories,
    required this.rangeValues,
  });

  final List<PlaceCategory> selectedCategories;
  final (double, double) rangeValues;

  bool get isFiltering =>
      selectedCategories.isNotEmpty ||
      rangeValues.$1 != 10 ||
      rangeValues.$2 != 30;

  PlaceFilters copyWith({
    List<PlaceCategory>? selectedCategories,
    (double, double)? rangeValues,
  }) {
    return PlaceFilters(
        selectedCategories: selectedCategories ?? this.selectedCategories,
        rangeValues: rangeValues ?? this.rangeValues);
  }

  const PlaceFilters.initial()
      : selectedCategories = const [],
        rangeValues = (10, 30);

  @override
  List<Object?> get props => [
        selectedCategories,
        rangeValues,
      ];
}
