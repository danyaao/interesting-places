import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/place_dm.dart';

class PlaceListListView extends StatelessWidget {
  const PlaceListListView({
    super.key,
    required this.places,
  });

  final List<PlaceDM> places;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: places.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 24);
      },
      itemBuilder: (context, index) {
        return PlaceCard(
          placeDM: places[index],
        );
      },
    );
  }
}
