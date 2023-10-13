import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';

class FilterGrid extends StatelessWidget {
  const FilterGrid({
    super.key,
    required this.selectedIndexes,
    required this.label,
    required this.onTap,
  });

  final List<int> selectedIndexes;
  final String label;
  final ValueSetter onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final colors = context.colors;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label.toUpperCase(),
            style: text.superSmall,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
            ),
            itemCount: PlaceCategory.values.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () => onTap(index),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.green.withOpacity(0.25),
                      ),
                      width: 64,
                      height: 64,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              PlaceCategory.values[index].iconPath,
                              colorFilter: ColorFilter.mode(
                                colors.green,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          selectedIndexes.contains(index)
                              ? const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.check_circle),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    PlaceCategory.values[index]
                        .getPlaceCategoryName(l10n)
                        .capitalize(),
                    style: text.superSmall,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
