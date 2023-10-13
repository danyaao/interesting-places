import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.label,
  });

  final VoidCallback onPressed;
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final colors = context.colors;

    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              colors.grey,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: text.button.copyWith(
              color: colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
