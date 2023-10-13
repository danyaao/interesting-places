import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class OutlinedForm extends StatelessWidget {
  const OutlinedForm({
    super.key,
    required this.controller,
    required this.label,
    required this.linesCount,
    this.isValid,
    this.textInputType = TextInputType.text,
  }) : isActive = isValid != null;

  final TextEditingController controller;
  final String label;
  final int linesCount;
  final bool? isValid;
  final bool isActive;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final colors = context.colors;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: colors.grey),
    );

    final activeBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: colors.green),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: colors.red),
    );

    final decoration = InputDecoration(
      enabledBorder: isActive ? activeBorder : border,
      focusedBorder: isActive ? activeBorder : border,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      errorText: (isValid ?? true) ? null : '',
      errorStyle: const TextStyle(height: 0),
    );
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label.toUpperCase(),
            style: text.superSmall,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: decoration,
          controller: controller,
          minLines: linesCount,
          maxLines: linesCount,
          keyboardType: textInputType,
        ),
      ],
    );
  }
}
