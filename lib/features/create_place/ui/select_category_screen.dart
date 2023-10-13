import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';

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
    final text = context.text;
    final theme = context.theme;
    final colors = context.colors;

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
                itemCount: PlaceCategory.values.length,
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
                            child: Text(
                              PlaceCategory.values[index]
                                  .getPlaceCategoryName(l10n)
                                  .capitalize(),
                              style: text.text,
                            ),
                          ),
                          selectedCategoryIndex == index
                              ? Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      AppAssets.iconCheck,
                                      colorFilter: ColorFilter.mode(
                                        colors.green,
                                        BlendMode.srcIn,
                                      ),
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
            const Spacer(),
            BottomButton(
              onPressed: () => Navigator.pop(
                context,
                PlaceCategory.values[selectedCategoryIndex!],
              ),
              label: l10n.saveButton,
              isActive: selectedCategoryIndex != null,
            ),
          ],
        ),
      ),
    );
  }
}
