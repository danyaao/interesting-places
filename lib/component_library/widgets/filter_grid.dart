import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class FilterGrid extends StatelessWidget {
  const FilterGrid({
    super.key,
    required this.items,
    required this.selectedIndexes,
    required this.name,
    required this.onTap,
  });

  final List<(IconData, String)> items;
  final List<int> selectedIndexes;
  final String name;
  final ValueSetter onTap;

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final colors = context.colors;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: text.superSmall,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final itemIconData = items[index].$1;
              final itemName = items[index].$2;

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
                            child: Icon(
                              itemIconData,
                              color: colors.green,
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
                  Text(itemName),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
