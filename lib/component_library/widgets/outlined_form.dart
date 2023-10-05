import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class OutlinedForm extends StatelessWidget {
  const OutlinedForm({
    super.key,
    required this.controller,
    required this.label,
    required this.linesCount,
  });

  final TextEditingController controller;
  final String label;
  final int linesCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: colors.secondary),
    );

    final decoration = InputDecoration(
      enabledBorder: border,
      focusedBorder: border,
    );

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: text.superSmall,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: decoration,
          controller: controller,
          minLines: linesCount,
          maxLines: linesCount,
        ),
      ],
    );
  }
}
