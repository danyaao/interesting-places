import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isActive,
    this.iconPath,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isActive;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final colors = context.colors;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: isActive ? colors.green : colors.lightGrey,
            foregroundColor: isActive ? colors.white : colors.grey,
            elevation: 0,
          ),
          onPressed: isActive ? onPressed : () {},
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: Center(
              child: iconPath == null
                  ? Text(
                      label.toUpperCase(),
                      style: text.small,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            iconPath!,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          label.toUpperCase(),
                          style: text.button,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
