import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/features/place_details/place_details.dart';

class PlaceListListView extends StatelessWidget {
  const PlaceListListView({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: places.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 24);
      },
      itemBuilder: (context, index) {
        return PlaceCard(
          place: places[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaceDetailsScreen(
                  place: places[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
