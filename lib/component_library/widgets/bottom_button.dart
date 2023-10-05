import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isActive,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: isActive ? colors.secondary : colors.onSecondary,
              foregroundColor: isActive ? colors.primary : colors.onSurface,
              elevation: 0,
            ),
            onPressed: isActive ? onPressed : () {},
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: Text(label),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
