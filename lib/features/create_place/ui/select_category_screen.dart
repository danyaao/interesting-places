import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({
    super.key,
  });

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final colors = context.colors;
    final categories = l10n.categories.split(';');

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.categoryAppBar),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 500,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(categories[index]),
                          ),
                          selectedCategoryIndex == index
                              ? Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.check,
                                      color: colors.green,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            BottomButton(
              onPressed: () =>
                  Navigator.pop(context, categories[selectedCategoryIndex!]),
              label: l10n.saveButton,
              isActive: selectedCategoryIndex != null,
            ),
          ],
        ),
      ),
    );
  }
}
