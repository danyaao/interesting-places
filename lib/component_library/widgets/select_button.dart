import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.select,
    required this.label,
    required this.selected,
  });

  final VoidCallback select;
  final String label;
  final String selected;

  @override
  Widget build(BuildContext context) {
    final text = context.text;

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
          onTap: select,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Text(selected),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.navigate_next),
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
