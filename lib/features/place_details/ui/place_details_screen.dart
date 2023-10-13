import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/features/place_details/place_details.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaceDetailsBloc>(
      create: (context) => PlaceDetailsBloc(place: place),
      child: const PlaceDetailsWidget(),
    );
  }
}

class PlaceDetailsWidget extends StatelessWidget {
  const PlaceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final theme = context.theme;

    return BlocBuilder<PlaceDetailsBloc, PlaceDetailsState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  PhotoCarousel(
                    images: state.place.images,
                  ),
                  BackArrowButton(
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.place.name,
                            style: text.title,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.place.category.getPlaceCategoryName(l10n),
                            style: text.smallBold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.place.description,
                            style: text.small,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    BottomButton(
                      onPressed: () {},
                      label: l10n.buildRouteButton,
                      isActive: true,
                      iconPath: AppAssets.iconRoute,
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: TextIconButton(
                                onPressed: () {},
                                iconPath: AppAssets.iconCalendarOutline,
                                label: l10n.scheduleButton,
                              ),
                            ),
                            Expanded(
                              child: TextIconButton(
                                onPressed: () {},
                                iconPath: AppAssets.iconFavouriteOutline,
                                label: l10n.favouriteButton,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
