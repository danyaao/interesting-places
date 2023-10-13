import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.place,
    required this.onTap,
  });

  final Place place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          SizedBox(
            height: 188,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                place.images.first,
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
                            place.category.getPlaceCategoryName(l10n),
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
                            child: SvgPicture.asset(
                              AppAssets.iconFavouriteOutline,
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
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                place.name,
                                style: text.text,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                place.description,
                                style: text.small.copyWith(
                                  color: colors.grey,
                                ),
                              ),
                            ),
                          ],
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
