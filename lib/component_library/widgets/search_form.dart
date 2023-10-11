import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final colors = context.colors;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );

    final inputDecoration = InputDecoration(
      prefixIcon: const Icon(Icons.search),
      fillColor: colors.lightGrey,
      filled: true,
      hintText: l10n.searchBarTextFieldHint,
      hintStyle: text.text.copyWith(color: colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.filter_alt_outlined,
          color: colors.green,
        ),
        onPressed: onPressed,
      ),
      border: border,
      focusedBorder: border,
      enabledBorder: border,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: TextField(
          controller: controller,
          decoration: inputDecoration,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
