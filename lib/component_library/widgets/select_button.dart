import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.onTap,
    required this.label,
    this.selected,
  });

  final VoidCallback onTap;
  final String label;
  final String? selected;

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
            label,
            style: text.superSmall,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Text(
                  selected == null
                      ? l10n.unselectedButton.capitalize()
                      : selected!,
                  style: selected == null
                      ? text.text.copyWith(color: colors.grey)
                      : text.text,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      AppAssets.iconNextArrow,
                      colorFilter: ColorFilter.mode(
                        colors.darkest,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
