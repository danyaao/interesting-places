import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/place_dm.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.placeDM,
  });

  final PlaceDM placeDM;

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final colors = context.colors;

    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          SizedBox(
            height: 188,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                placeDM.images.first,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 188,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                          ),
                          child: Text(
                            placeDM.category.toLowerCase(),
                            style: text.smallBold.copyWith(
                              color: colors.white,
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox(height: 0)),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            top: 16,
                          ),
                          child: InkWell(
                            child: Icon(
                              Icons.favorite_outline,
                              color: colors.white,
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.lightGrey,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text(
                                placeDM.name,
                                style: text.text,
                              ),
                              Text(
                                placeDM.description ?? '',
                                style: text.superSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
