import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/features/create_place/create_place.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

class CreatePlaceScreen extends StatelessWidget {
  const CreatePlaceScreen({
    super.key,
    required this.placeRepository,
  });

  final PlaceRepository placeRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePlaceBloc>(
      create: (_) => CreatePlaceBloc(
        placeRepository: placeRepository,
      ),
      child: const CreatePlaceWidget(),
    );
  }
}

class CreatePlaceWidget extends StatefulWidget {
  const CreatePlaceWidget({super.key});

  @override
  State<CreatePlaceWidget> createState() => _CreatePlaceWidgetState();
}

class _CreatePlaceWidgetState extends State<CreatePlaceWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  CreatePlaceBloc get _bloc => context.read<CreatePlaceBloc>();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      _bloc.add(
        NameChangedEvent(name: _nameController.text),
      );
    });

    _descriptionController.addListener(() {
      _bloc.add(
        DescriptionChangedEvent(description: _descriptionController.text),
      );
    });

    _latitudeController.addListener(() {
      _bloc.add(
        LatitudeChangedEvent(latitude: _latitudeController.text),
      );
    });

    _longitudeController.addListener(() {
      _bloc.add(
        LongitudeChangedEvent(longitude: _longitudeController.text),
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.text;
    final theme = context.theme;
    final colors = context.colors;

    return BlocBuilder<CreatePlaceBloc, CreatePlaceState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              l10n.newPlaceAppBar.capitalize(),
              style: text.subtitle,
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Text(
                  l10n.cancelAppBar.capitalize(),
                  style: text.small.copyWith(color: colors.grey),
                ),
              ),
            ),
          ),
          body: switch (state) {
            CreatePlaceInProgressState() => Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    PhotoPicker(
                      add: () {
                        _bloc.add(const PickImagesFromGalleryEvent());
                      },
                      delete: (index) {
                        _bloc.add(DeleteImageFromSelectionEvent(index: index));
                      },
                      images: state.images ?? [],
                    ),
                    const SizedBox(height: 24),
                    SelectButton(
                      onTap: () async {
                        final selectedCategory = await openSelectCategoryScreen(
                          context: context,
                        );
                        _bloc.add(SelectCategoryEvent(
                          selectedCategory: selectedCategory,
                        ));
                      },
                      label: l10n.categoryButton.toUpperCase(),
                      selected: state.category
                              ?.getPlaceCategoryName(l10n)
                              .capitalize(),
                    ),
                    const SizedBox(height: 24),
                    OutlinedForm(
                      controller: _nameController,
                      label: l10n.placeNameTextField,
                      linesCount: 1,
                      isValid: state.isNameValid,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(
                          child: OutlinedForm(
                            controller: _latitudeController,
                            label: l10n.latitudeTextField,
                            linesCount: 1,
                            isValid: state.isLatitudeValid,
                            textInputType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: OutlinedForm(
                            controller: _longitudeController,
                            label: l10n.longitudeTextField,
                            linesCount: 1,
                            isValid: state.isLongitudeValid,
                            textInputType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          l10n.pointOnTheMapButton.capitalize(),
                          style: text.text.copyWith(color: colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    OutlinedForm(
                      controller: _descriptionController,
                      label: l10n.descriptionTextField,
                      linesCount: 5,
                    ),
                    const Spacer(),
                    BottomButton(
                      label: l10n.createButton,
                      onPressed: () {
                        _bloc.add(const SavePlaceEvent());
                      },
                      isActive: state.canCreate ?? false,
                    ),
                  ],
                ),
              ),
            CreatePlaceSuccessState() => Builder(
                builder: (context) {
                  SchedulerBinding.instance.addPostFrameCallback(
                    (_) => closeCreatePlaceScreen(
                      place: state.place,
                      context: context,
                    ),
                  );

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
          },
        );
      },
    );
  }

  Future<PlaceCategory> openSelectCategoryScreen({
    required BuildContext context,
  }) async {
    final PlaceCategory placeCategory = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectCategoryScreen(),
      ),
    );

    return placeCategory;
  }

  void closeCreatePlaceScreen({
    required Place place,
    required BuildContext context,
  }) {
    Navigator.pop(context, place);
  }
}
